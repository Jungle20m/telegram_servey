from sqlalchemy.orm import Session
from . import models, schemas

from .database import SessionLocal



class Users():
    db = SessionLocal()
    
    @classmethod
    def get_user(cls, user_id: int):
        return cls.db.query(models.User).filter(models.User.id == user_id).first()
    
    @classmethod
    def get_user_active(cls):
        return cls.db.query(models.User).filter(models.User.active_status == 1).all()
    
    
    

class TimeKeeping():
    db = SessionLocal()
    
    @classmethod
    def get_timekeeping_by_date_and_userid(cls, user_id, date):
        return cls.db.query(models.TimeKeeping)\
                    .filter(models.TimeKeeping.user_id == user_id)\
                    .filter(models.TimeKeeping.checkin.like(f'%{date}%'))\
                    .first()
                    

class Departments():
    db = SessionLocal()
    
    @classmethod
    def get_departments(cls):
        return cls.db.query(models.Department).all()
    
    @classmethod
    def get_users_in_department(cls, department_id: int):
        return cls.db.query(models.User).filter(models.User.id.in_(\
                    cls.db.query(models.UserDepartment.user_id).filter(models.UserDepartment.department_id==department_id)))
    
    