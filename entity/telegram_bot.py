import telegram
from telegram import InlineKeyboardButton, InlineKeyboardMarkup


class ServeyTelegram():
    def __init__(self, token='1397165834:AAHG3kbHp61l1XKkTqn-XIem-2hMiiQsDDY'):
        self.bot = telegram.Bot(token)

    def send_message(self, telegram_id, text, reply_markup=None):
        self.bot.send_message(chat_id=telegram_id, text=text, reply_markup=reply_markup)


class InlineMarkup:
    status_icon = {
        "-1": "", # empty
        "0": "✖", # incprrect
        "1": "✔" # correct
    }


    def __init__(self):
        self.button = []

    def add_button(self, text, callback, status="-1"):
        icon = self.status_icon[str(status)]
        text = "%s %s" % (text, icon)
        self.button.append([InlineKeyboardButton(text, callback_data=callback)])

    def get_inline_markup(self):
        return InlineKeyboardMarkup(self.button)
