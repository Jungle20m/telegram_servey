from sqlalchemy.orm import Session
from . import models, schemas

from .database import SessionLocal



class Users:

    @staticmethod
    def get_user(id: int):
        try:
            db = SessionLocal()
            return db.query(models.User).filter(models.User.id == id).first()
        finally:
            db.close()
        
    
    @staticmethod
    def get_users_active():
        try:
            db = SessionLocal()
            return db.query(models.User).filter(models.User.active_status == 1).all()
        finally:
            db.close()

    @staticmethod
    def get_user_active(id: int):
        try:
            db = SessionLocal()
            return db.query(models.User)\
                    .filter(models.User.active_status == 1)\
                    .filter(models.User.id == id).first()
        finally:
            db.close()

class Servey:

    @staticmethod
    def get_servey(id: int):
        try:
            db = SessionLocal()
            return db.query(models.Servey).filter(models.Servey.id == id).first()
        finally:
            db.close()

class Question:
    @staticmethod
    def get_question(id:int):
        try:
            db = SessionLocal()
            return db.query(models.Question).filter(models.Question.id == id).first()
        finally:
            db.close()

    @staticmethod
    def get_next_question_by_current_question_id(id:int):
        try:
            db = SessionLocal()
            return db.query(models.Question)\
                        .filter(models.Question.id == db.query(models.Question.next_question_id).filter(models.Question.id == id))\
                        .first()
        finally:
            db.close()

class Answer:

    @staticmethod
    def get_answer(id:int):
        try:
            db = SessionLocal()
            return db.query(models.Answer).filter(models.Answer.id == id).first()
        finally:
            db.close()

    @staticmethod
    def get_answer_by_callback(callback: str):
        try:
            db = SessionLocal()
            return db.query(models.Answer).filter(models.Answer.callback == callback).first()
        finally:
            db.close()

    @staticmethod
    def get_answers_by_question_id(question_id:int):
        try:
            db = SessionLocal()
            return db.query(models.Answer).filter(models.Answer.question_id == question_id).all()
        finally:
            db.close()

    @staticmethod
    def get_question(answer_id: str):
        try:
            db = SessionLocal()
            return db.query(models.Question)\
                        .filter(models.Question.id == db.query(models.Answer.question_id).filter(models.Answer.id == answer_id))\
                        .first()
        finally:
            db.close()

class UserServey:

    @staticmethod
    def get_user_servey_by_user_and_servey(user_id: int, servey_id: int):
        try:
            db = SessionLocal()
            return db.query(models.UserServey)\
                        .filter(models.UserServey.user_id == user_id)\
                        .filter(models.UserServey.servey_id == servey_id).first()
        finally:
            db.close()

    @staticmethod
    def create_user_servey(user_servey: schemas.UserServey):
        try:
            db = SessionLocal()
            db_user_servey = models.UserServey(id=user_servey.id, user_id=user_servey.user_id, servey_id=user_servey.servey_id)
            db.add(db_user_servey)
            db.commit()
            db.refresh(db_user_servey)
            return db_user_servey
        finally:
            db.close()

class ServeyTimes:

    @staticmethod
    def create_servey_times(servey_times: schemas.ServeyTimes):
        try:
            db = SessionLocal()
            db_servey_times = models.ServeyTimes(
                                    id=servey_times.id, 
                                    user_servey_id=servey_times.user_servey_id, 
                                    key=servey_times.key, 
                                    created_at=servey_times.created_at)
            db.add(db_servey_times)
            db.commit()
            db.refresh(db_servey_times)
            return db_servey_times
        finally:
            db.close()

    @staticmethod
    def get_servey_times_by_key(key: str):
        try:
            db = SessionLocal()
            return db.query(models.ServeyTimes).filter(models.ServeyTimes.key == key).first()
        finally:
            db.close()

class ServeyHistory:

    @staticmethod
    def get_servey_history_by_elements(servey_time_id: int, question_id: int):
        try:
            db = SessionLocal()
            return db.query(models.ServeyHistory)\
                        .filter(models.ServeyHistory.servey_time_id == servey_time_id)\
                        .filter(models.ServeyHistory.question_id == question_id)\
                        .first()
        finally:
            db.close()

    @staticmethod
    def create_servey_history(servey_history: schemas.ServeyHistory):
        try:
            db = SessionLocal()
            db_servey_history = models.ServeyHistory(
                                    id=servey_history.id,
                                    servey_time_id=servey_history.servey_time_id,
                                    question_id=servey_history.question_id,
                                    answer_id=servey_history.answer_id)
            db.add(db_servey_history)
            db.commit()
            db.refresh(db_servey_history)
            return db_servey_history
        finally:
            db.close()