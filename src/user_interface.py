import src.utils.syntax_check as syntax
from src.utils.utils import *


class User:
    def __init__(self):
        self.username = None
        self.email = None
        self.password = None
        self.contact_number = None

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

            query = "SELECT * FROM User WHERE username='{}' AND password = '{}';".format(self.username, self.password)

            return query

        except Exception as e:
            print(e)

    # def book(self):
    #     try:


class UserInterface:
    def __init__(self, db):
        self.current_user = User()
        self.db = db

    def login_user(self):
        query = self.current_user.login()

        rows = self.db.get_result(query)

        if len(rows) == 1:
            self.current_user = rows
            return True
        else:
            perror("Not a valid User, try again")
            return False

    def loop(self):
        while True:
            if self.login_user():
                break
