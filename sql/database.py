from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


engine = create_engine(
    "mysql+mysqlconnector://hrms:8MNwpD5kZP2WBfcN@172.16.1.50:3306/db_hrms"  
)

SessionLocal = sessionmaker(bind=engine, autocommit=False, autoflush=False)

Base = declarative_base()