import random
import string



def generate_random_string(length):
    return ''.join(str(random.randint(0, 9)) for i in range(length))

def callback_answer_message_is_valid(callback):
    try:
        values = callback.split("#")
        if len(values) == 2:
            answer_callback, key = values
            if (answer_callback is not None) and (answer_callback != "") and (key is not None) and (key != ""):
                return True
        return False
    except Exception as e:
        return False  

def create_callback_answer_message(answer_callback, key):
    return '#'.join((str(answer_callback), str(key)))

def separate_callback_answer_message(callback):
    if callback_answer_message_is_valid(callback):
        return callback.split("#")
    else:
        return None, None

