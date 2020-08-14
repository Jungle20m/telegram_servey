from sqlalchemy.orm import Session

from sql import models, schemas
from sql.database import engine, SessionLocal

from sql.crud import Users, TimeKeeping, Departments

models.Base.metadata.create_all(bind=engine)

if __name__ == '__main__':
    db = SessionLocal()
    
    departments = Departments.get_departments()
    
    # loop all departments in company
    for department in departments:
        # get all users in department
        users = Departments.get_users_in_department(department.id)
        for user in users:
            #! create basic row in report
            row = {}
        #! create total row of department in report
    
    
    