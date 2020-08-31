from sqlalchemy import Column, String, Integer, Date, DateTime, Text
from sqlalchemy.sql import func

from .database import Base


class User(Base):
    __tablename__ = 'users'
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(255), index=True)
    short_name = Column(String(45))
    email = Column(String(255)) 
    email_verified_at = Column(DateTime)
    password = Column(String(255))
    gender = Column(Integer)
    remember_token = Column(String(100))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)
    google_id = Column(String(255))
    active_status = Column(Integer)
    phone = Column(String(255))
    birthday = Column(Date)
    date_in = Column(Date)
    date_out = Column(Date)
    trial_date = Column(Date)
    telegram_id = Column(Integer)


class Answer(Base):
    __tablename__ = 'answers'

    id = Column(Integer, primary_key=True, index=True)
    question_id = Column(Integer)
    name = Column(String(255))
    callback = Column(String(255))
    status = Column(Integer)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)

    def is_correct(self):
        return True if self.status == 1 else False


class Question(Base):
    __tablename__ = 'questions'

    id = Column(Integer, primary_key=True, index=True)
    servey_id = Column(Integer)
    next_question_id = Column(Integer)
    name = Column(String(255))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)


class Servey(Base):
    __tablename__ = 'servey'

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(255))
    name = Column(String(255))
    description = Column(String(65535))
    head_question_id = Column(Integer)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)


class UserServey(Base):
    __tablename__ = 'user_servey'

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer)
    servey_id = Column(Integer)


class ServeyTimes(Base):
    __tablename__ = 'servey_times'

    id = Column(Integer, primary_key=True, index=True)
    user_servey_id = Column(Integer)
    key = Column(String(255))
    created_at = Column(DateTime(timezone=True), default=func.now())


class ServeyHistory(Base):
    __tablename__ = 'servey_history'

    id = Column(Integer, primary_key=True, index=True)
    servey_time_id = Column(Integer)
    question_id = Column(Integer)
    answer_id = Column(Integer)