from sqlalchemy.orm import Session

from sql import models, schemas
from sql.database import engine, SessionLocal
from sql.crud import Users, Servey, Question, Answer, UserServey, ServeyTimes

from entity.telegram_bot import ServeyTelegram, InlineMarkup

from utils.model import ServeyTimeUtils
from utils import character

models.Base.metadata.create_all(bind=engine)


if __name__ == '__main__':    
    """ sending servey """
    # example
    servey_id = 1
    user_id = 225

    # broadcast servey to telegram, if success, update to database
    try:
        # get user active by user_id
        user = Users.get_user_active(user_id)
        # get servey by servey_id
        servey = Servey.get_servey(servey_id)
        # get question by servey_id and head_question_id
        question = Question.get_question(servey.head_question_id)
        # get answers by question_id
        answers = Answer.get_answers_by_question_id(question.id)
        """defind message to sending telegram"""
        # key of servey for user at this time
        key = ServeyTimeUtils.make_random_key()
        # make message to sending
        inline_markup = InlineMarkup()
        for answer in answers:
            callback = character.create_callback_answer_message(answer.callback, key)
            inline_markup.add_button(text=answer.name, callback=callback)
        # send message
        servey_bot = ServeyTelegram()
        servey_bot.send_message(telegram_id=user.telegram_id, text=servey.title)
        servey_bot.send_message(telegram_id=user.telegram_id, text=question.name, reply_markup=inline_markup.get_inline_markup())
    except Exception as e:
        """log exception"""
        # log error message here
        print(f"level 1: {e}")
    else:
        try:
            """save session to database if done to sending telegram"""
            # get user_servey_id
            user_servey = UserServey.get_user_servey_by_user_and_servey(user.id, servey.id)
            # if user_servey record is not exist, create one
            if user_servey is None:
                # save user_servey record to know who got that message
                us = models.UserServey(user_id=user.id, servey_id=servey.id)
                user_servey = UserServey.create_user_servey(us)
            # save servey_times record to know "message đó được gửi lần thứ bao nhiêu"
            st = models.ServeyTimes(user_servey_id=user_servey.id, key=key)
            servey_times = ServeyTimes.create_servey_times(st)
        except Exception as e:
            """log exception"""
            print(f"level 2: {e}")
        else:
            pass