from sqlalchemy.orm import Session
from telegram import ReplyKeyboardMarkup, ReplyKeyboardRemove
from telegram.ext import Updater, CommandHandler, MessageHandler, Filters, ConversationHandler, CallbackQueryHandler

from sql import models, schemas
from sql.database import engine, SessionLocal
from sql.crud import Users, Servey, Question, Answer, ServeyTimes, ServeyHistory

from entity.telegram_bot import ServeyTelegram, InlineMarkup

from utils import character
from utils.model import ServeyTimeUtils


models.Base.metadata.create_all(bind=engine)

SERVEY_BOT = "1397165834:AAHG3kbHp61l1XKkTqn-XIem-2hMiiQsDDY"


def listener(update, context):
    try:
        message_callback = update.callback_query.data
        answer_callback, answer_key = character.separate_callback_answer_message(message_callback)
        # user telegram id
        user_telegram_id = update.callback_query.message.chat.id
        # get answer
        answer = Answer.get_answer_by_callback(answer_callback)
        # get question by answer_id
        question = Answer.get_question(answer.id)
        """check if the question has been answered?"""
        # get serveytimes by key
        servey_times = ServeyTimes.get_servey_times_by_key(answer_key)
        # get servey history by servey_time_id, question_id
        servey_history = ServeyHistory.get_servey_history_by_elements(servey_times.id, question.id)
        # if the question has not been answered
        if servey_history is None:
            # insert record into database to know this question has been answered
            sh = models.ServeyHistory(servey_time_id=servey_times.id, question_id=question.id, answer_id=answer.id)
            servey_history = ServeyHistory.create_servey_history(sh)
            """broadcast result of question to user"""
            # get answer by this question_id
            answers = Answer.get_answers_by_question_id(question.id)
            # create inline button
            inline_markup = InlineMarkup()
            for answ in answers:
                callback = character.create_callback_answer_message(answ.callback, answer_key)
                if (answ.id == answer.id) or (answ.is_correct()):
                    inline_markup.add_button(text=answ.name, callback=callback, status=answ.status)
                else:
                    inline_markup.add_button(text=answ.name, callback=callback)
            # update message with result
            update.callback_query.edit_message_text(text=question.name, reply_markup=inline_markup.get_inline_markup())
            """broadcast next question to user"""
            next_question = Question.get_next_question_by_current_question_id(question.id)
            # if this question isn't last question 
            if next_question is not None:
                # get next  answers
                next_answers = Answer.get_answers_by_question_id(next_question.id)
                # make message to sending
                next_inline_markup = InlineMarkup()
                for next_answ in next_answers:
                    callback = character.create_callback_answer_message(next_answ.callback, answer_key)
                    next_inline_markup.add_button(text=next_answ.name, callback=callback)
                # send the next question to user
                context.bot.send_message(chat_id=user_telegram_id, text=next_question.name, reply_markup=next_inline_markup.get_inline_markup())
            else:
                context.bot.send_message(chat_id=user_telegram_id, text="Cảm ơn bạn đã tham gia cuộc khảo sát")
        else:
            print(f"Câu hỏi này đã được trả lời")
    except Exception as e:
        print(e)
    else:
        pass
    

if __name__ == '__main__':
    updater = Updater(SERVEY_BOT, use_context=True)

    dispatcher = updater.dispatcher

    dispatcher.add_handler(CallbackQueryHandler(listener))
    
    updater.start_polling()
    updater.idle()