from sqlalchemy import Column, String, Integer, Date, DateTime, Text

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

    
class TimeKeeping(Base):
    __tablename__ = 'timekeeping' 
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer)
    checkin = Column(DateTime)
    checkout = Column(DateTime)
    note = Column(Text)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)


class Department(Base):
    __tablename__ = 'departments'
    
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(45))
    short_name = Column(String(255))
    leader_id = Column(String(45))
    created_at = Column(DateTime)
    updated_at = Column(DateTime)


class UserDepartment(Base):
    __tablename__ = 'user_departments'
    
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer)
    department_id = Column(Integer)
    position = Column(Integer)
    created_at = Column(DateTime)
    updated_at = Column(DateTime)