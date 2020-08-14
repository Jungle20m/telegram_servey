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
        

class TimeKeeping(BaseModel):
    id: int
    user_id: int
    checkin: Optional[datetime] = None
    checkout: Optional[datetime] = None
    note: str
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None
    
    class Config:
        orm_mode = True
        

class Department(BaseModel):
    id: int
    name: str
    short_name: str
    leader_id: str
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None
    
    class Config:
        orm_mode = True
        

class UserDepartment(BaseModel):
    id: int
    user_id: int
    department_id: int
    position: int
    created_at: Optional[datetime] = None
    updated_at: Optional[datetime] = None