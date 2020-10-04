import src.utils.syntax_check as syntax
from src.utils.utils import *


class User:
    def __init__(self, db):
        self.username = None
        self.email = None
        self.password = None
        self.contact_number = None
        self.db = db

    def get_name(self):
        self.username = input("Enter Username: ").lower()
        return perror("Username cannot be empty") if syntax.empty(self.username) else True

    def get_email(self):
        self.email = input("Enter the email of the user: ").lower()
        return perror("Invalid email") if not syntax.validate_email(self.email) else True

    def get_password(self):
        self.password = input("Enter Password: ")
        return perror("Password cannot be empty") if syntax.empty(self.password) else True

    def get_contact(self):
        self.contact_number = input("Enter the Contact Number of the User: ").lower()
        return perror("Invalid Contact Number") if not syntax.validate_phone_number(
            self.contact_number) else True

    def create(self):
        try:
            repeat_and_error(self.get_name)()
            repeat_and_error(self.get_email)()
            repeat_and_error(self.get_password)()
            repeat_and_error(self.get_contact)()

            query = ["INSERT INTO User( username, email, password,contact_number)" \
                     "VALUES ( '{}', '{}', '{}', '{}')".format(self.username, self.email, self.password,
                                                               self.contact_number)]
            print(query)
            return query

        except ValueError as e:
            print(e.args[0])

    def login(self):
        try:
            repeat_and_error(self.get_name)()
            repeat_and_error(self.get_password)()

            query = "SELECT * FROM user WHERE username='{}' AND password = '{}';".format(self.username, self.password)

            self.db.execute(query)

        except ValueError as e:
            print(e)
