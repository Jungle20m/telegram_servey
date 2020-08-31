from typing import List, Optional
from pydantic import BaseModel
from datetime import datetime, date


class User(BaseModel):
    id: int
    name: str
    short_name: Optional[str] = None
    email: str
    email_verified_at: Optional[datetime] = None
    password: Optional[str] = None
    gender: int
    remember_token: Optional[str] = None
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None
    google_id: Optional[str] = None
    active_status: int
    phone: Optional[str] = None
    birthday: Optional[date] = None
    date_in: Optional[date] = None
    date_out: Optional[date] = None
    trial_date: Optional[date] = None
    telegram_id: Optional[int] = None

    class Config:
        orm_mode = True
        

class Question(BaseModel):
    id: int
    servey_id: int
    next_question_id: int
    name: str
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None

    class Config:
        orm_mode = True


class Answer(BaseModel):
    id: int
    question_id: int
    name: str
    callback: str
    status: int
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None

    class Config:
        orm_mode = True


class Servey(BaseModel):
    id: int
    title: str
    name: str
    description: str
    head_question_id: int
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None

    class Config:
        orm_mode = True


class UserServey(BaseModel):
    id: int
    user_id: int
    servey_id: int

    class Config:
        orm_mode = True


class ServeyTimes(BaseModel):
    id: int
    user_servey_id: int
    key: str
    created_at: datetime

    class Config:
        orm_mode = True


class ServeyHistory(BaseModel):
    id: int
    servey_time_id: int
    question_id: int
    answer_id: int

    class Config:
        orm_mode = True