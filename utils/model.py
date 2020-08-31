import time

from . import character


class ServeyTimeUtils:

    @staticmethod
    def make_random_key():
        time_ = time.time()
        random_string = character.generate_random_string(10)
        key = "%s%s" % (time_, random_string)
        return key
