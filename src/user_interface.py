import time

from tabulate import tabulate

import src.utils.syntax_check as syntax
from src.classes.user import User
from src.utils.utils import *


class UserInterface:
    def __init__(self, db):
        self.current_user = User()
        self.db = db
        self.options = [
            'Discover Services',
            'Book a Service',
            'Cancel a Booking',
            'Provide Feedback',
            'Exit'
        ]
        self.functions = [
            self.discover,
            self.do_a_booking,
            self.cancel_booking,
            self.give_feedback
        ]
        self.curr_opt = 0

    def create_user(self):
        self.current_user = User()
        query = self.current_user.create()
        res = self.db.execute_query([query])
        return res

    def login_user(self):
        query = self.current_user.login()

        rows = self.db.get_result(query)

        if len(rows) == 1:
            rows = rows[0]
            self.current_user.user_id = rows['user_id']
            self.current_user.username = rows['username']
            self.current_user.email = rows['email']
            self.current_user.password = rows['password']
            self.current_user.contact_number = int(rows['contact_number'])
            self.current_user.dob = rows['date_of_birth']
            return True
        else:
            perror("Not a valid User, try again")
            return False

    def choose_options(self):
        self.curr_opt = int(input('Enter the corresponding option for which activity you want to perform:'))
        if not syntax.validate_range(self.curr_opt, 1, len(self.options)):
            perror("must be from one of the options")
            return False
        else:
            return True

    def discover(self):
        try:
            while True:
                print_header('Discover')
                national_list = "SELECT unit_code, name from National_Park"
                rows = self.db.get_result(national_list)
                print('Here are the National Parks')
                i = 0
                for row in rows:
                    print('{}. {}'.format(i + 1, row['name']))
                    i += 1
                unit_code = int(input('Enter the corresponding number of the National Park you want to Discover:'))
                if not syntax.validate_range(unit_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_np = rows[unit_code - 1]

                print_header('Discover')
                service_list = "SELECT service_id, name, description from Services where provided_by ='{}' ".format(
                    target_np['unit_code'])
                rows = self.db.get_result(service_list)
                if len(rows) == 0:
                    print("Sorry No services are available in that National,",
                          "Kindly wait while we send you back to main screen")
                    time.sleep(5)
                    continue
                print("Here's a list of services in", target_np['name'])
                i = 0
                for row in rows:
                    print('{}. {}: \nAbout : {}'.format(i + 1, row['name'], row['description']))
                    i += 1
                service_code = int(input('Enter the corresponding number of the service you want to read about:'))
                if not syntax.validate_range(service_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_service = rows[service_code - 1]

                print_header('Discover')
                print("Name: " + target_service['name'] + " at " + target_np['name'] + "\nAbout: " + target_service[
                    'description'])

                qq = "select AVG(rating) from Service_Feedback where service_id = {}".format(
                    target_service['service_id'])

                rows = self.db.get_result(qq)

                if rows[0]['AVG(rating)'] is not None:
                    print("Cumulative Rating: " + str(rows[0]['AVG(rating)']))

                qq = "select User.username, Service_Feedback.rating, Service_Feedback.remarks, Service_Feedback.date " \
                     "from Service_Feedback inner join User on Service_Feedback.user_id = User.user_id " \
                     "where service_id = {} order by rating".format(target_service['service_id'])

                rows = self.db.get_result(qq)

                print(tabulate(rows, headers="keys"))

                print('Do you want to continue to Discover(y/n)')
                ans = input()
                if ans.lower() != 'y':
                    break

        except Exception as q:
            for part in q:
                perror(str(part)),
            time.sleep(5)

    def do_a_booking(self):
        global booking_id
        try:
            print_header('Booking')
            adult = int(input("Enter number of adults in the party:"))
            children = int(input("Enter the number of Children in the party:"))
            qq = "INSERT INTO Booking(user_id, number_of_adults, number_of_children) VALUES({}, {}, {})".format(
                self.current_user.user_id, adult, children)

            self.db.execute_query([qq])

            rows = self.db.get_result("SELECT LAST_INSERT_ID();")

            booking_id = rows[0]['LAST_INSERT_ID()']

            total_price = 0

            chosen = []

            q = []
            while True:
                # Get target National Park
                print_header('Booking')
                national_list = "SELECT unit_code, name from National_Park"
                rows = self.db.get_result(national_list)
                print('Here are the National Parks')
                i = 0
                for row in rows:
                    print('{}. {}'.format(i + 1, row['name']))
                    i += 1
                unit_code = int(input('Enter the corresponding number of the National Park you want to book:'))
                if not syntax.validate_range(unit_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_np = rows[unit_code - 1]

                # Get target Service
                print_header('Booking')
                service_list = "SELECT service_id, name, description from Services where provided_by ='{}' ".format(
                    target_np['unit_code'])
                rows = self.db.get_result(service_list)
                if len(rows) == 0:
                    print("Sorry No services are available in that National Park")
                    time.sleep(5)
                    continue
                print("Here's a list of services in", target_np['name'])
                i = 0
                for row in rows:
                    print('{}. {}: \n {}'.format(i + 1, row['name'], row['description']))
                    i += 1
                service_code = int(input('Enter the corresponding number of the service you want to book:'))
                if not syntax.validate_range(service_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_service = rows[service_code - 1]

                # Get target Sub_service
                print_header('Booking')
                timings_list = "SELECT sub_service_id, timings from Sub_service where service_id ='{}' ".format(
                    target_service['service_id'])
                rows = self.db.get_result(timings_list)
                if len(rows) == 0:
                    print("Sorry we couldn't find services that are available")
                    time.sleep(2.5)
                    continue
                print("Here's a list of timings of", target_service['name'])
                i = 0
                for row in rows:
                    print('{}. {}'.format(row['sub_service_id'], row['timings']))
                    i += 1
                sub_service_code = int(input('Enter the corresponding number of the timings of the service you want to '
                                             'book:'))
                if not syntax.validate_range(sub_service_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_sub_service = rows[sub_service_code - 1]

                # Get target Date
                print_header('Booking')
                dates_list = "SELECT date, price from Sub_service_timings where availability > 0" \
                             " AND sub_service_id = {}".format(sub_service_code)
                rows = self.db.get_result(dates_list)
                if len(rows) == 0:
                    print("Sorry No services are avaliable")
                    time.sleep(5)
                    continue
                print("Here's a list of dates which are available")
                i = 0
                for row in rows:
                    print('{}. {}'.format(i + 1, row['date']))
                    i += 1
                date_code = int(input('Enter the corresponding number of the date you want to book for:'))
                if not syntax.validate_range(sub_service_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_date = rows[date_code - 1]

                total_price += target_date['price']
                chosen.append('{} for Rs.{} at {} on {}'.format(target_service['name'], target_date['price'],
                                                                target_sub_service['timings'], target_date['date']))

                qq = "INSERT INTO Booking_service(booking_id, sub_service_id, price, target_date)" \
                     "VALUES ({}, {}, {}, '{}')".format(booking_id, target_sub_service['sub_service_id'],
                                                        target_date['price'], target_date['date'])
                q.append(qq)

                qq = "UPDATE Sub_service_timings SET availability = availability - 1" \
                     " where sub_service_id = {} AND date = '{}' AND availability > 0;".format(
                    target_sub_service['sub_service_id'], target_date['date'])

                q.append(qq)

                print('Do you want to continue to book services(y/n)')
                ans = input()
                if ans.lower() != 'y':
                    break

            for i in chosen:
                print(i)
            print("Total Expenses:", total_price)
            print('Do you want to book the above services(y/n)')
            ans = input()
            if ans.lower() != 'y':
                qq = "DELETE FROM Booking where booking_id = {}".format(booking_id)
                self.db.execute_query([qq])
                return
            self.db.execute_query(q)
            psuccess("Congratulations your booking was a success")
            time.sleep(5)

        except (ValueError, Exception) as q:
            qq = "DELETE FROM Booking where booking_id = {}".format(booking_id)
            self.db.execute_query([qq])
            print(type(q))
            time.sleep(5)

    def cancel_booking(self):
        try:
            while True:
                qq = "SELECT booking_id, number_of_adults, number_of_children from Booking where user_id = {}".format(
                    self.current_user.user_id)

                rows = self.db.get_result(qq)

                if len(rows) == 0:
                    print("Sorry we couldn't find any bookings by you,",
                          "You will now be transferred back to the main screen")
                    time.sleep(2.5)
                    continue

                i = 0
                for row in rows:
                    print('{}. {}'.format(i + 1, row['name']))
                    i += 1

                tmp = sp.call('clear', shell=True)
                f = Figlet(font='slant')
                print(f.renderText('Cancellation'))

                print(tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))
                booking_code = int(input('Enter the corresponding number of the booking you want to book for:'))
                if not syntax.validate_range(booking_code, 0, len(rows) - 1):
                    perror('invalid Input')
                    return

                del_booking_id = rows[booking_code - 1]['booking_id']

                qq = "DELETE FROM Booking where booking_id = '{}'".format(del_booking_id)

                self.db.execute_query([qq])

                print('Do you want to return back to the bookings page(y/n)')
                ans = input()
                if ans.lower() != 'y':
                    break

        except Exception as q:
            print(type(q))
            time.sleep(5)

    def give_feedback(self):
        try:
            q = []
            while True:
                tmp = sp.call('clear', shell=True)
                f = Figlet(font='slant')
                print(f.renderText('Feedback'))
                national_list = "SELECT unit_code, name from National_Park"
                rows = self.db.get_result(national_list)
                print('Here are the National Parks')
                i = 0
                for row in rows:
                    print('{}. {}'.format(i + 1, row['name']))
                    i += 1
                unit_code = int(
                    input('Enter the corresponding number of the National Park you want to provide feedback for:'))
                if not syntax.validate_range(unit_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_np = rows[unit_code - 1]

                tmp = sp.call('clear', shell=True)
                f = Figlet(font='slant')
                print(f.renderText('Feedback'))
                service_list = "SELECT service_id, name, description from Services where provided_by ='{}' ".format(
                    target_np['unit_code'])
                rows = self.db.get_result(service_list)
                if len(rows) == 0:
                    print("Sorry we couldn't find services that are available,",
                          "You will now be transferred back to the main screen")
                    time.sleep(2.5)
                    continue

                print("Here's a list of services offered by", target_np['name'])
                i = 0
                for row in rows:
                    print('{}. {}: \n {}'.format(i + 1, row['name'], row['description']))
                    i += 1

                service_code = int(
                    input('Enter the corresponding number of the service you want to provide feedback for:'))
                if not syntax.validate_range(service_code, 1, len(rows)):
                    perror('invalid Input')
                    return
                target_service = rows[service_code - 1]

                rating = int(input('Enter the rating you would like to give to {}'.format(target_service['name'])))

                if not syntax.validate_range(rating, 1, 5):
                    perror('invalid Input')
                    return

                print("Enter your remarks if any")
                remarks = input()

                qq = "INSERT INTO Service_Feedback(user_id, service_id, rating, remarks, date)" \
                     "VALUES({},{},{},'{}',NOW())".format(self.current_user.user_id, target_service['service_id'],
                                                          rating, remarks)

                q.append(qq)

                print('Do you want to continue give feedback(y/n)')
                ans = input()
                if ans.lower() != 'y':
                    break

            self.db.execute_query(q)
            psuccess("Congratulations your feedback was recorded")
            time.sleep(2.5)

        except Exception as q:
            print(type(q))
            time.sleep(5)

    def loop(self):
        print("Are you an existing user(y/n):")
        ans = input()
        if ans.lower() != 'y':
            tmp = sp.call('clear', shell=True)
            f = Figlet(font='slant')
            print(f.renderText('Registration'))
            while not self.create_user():
                pass
            psuccess('User successfully created')

        self.current_user = User()

        tmp = sp.call('clear', shell=True)
        f = Figlet(font='slant')
        print(f.renderText('User Login'))

        while True:
            if self.login_user():
                break

        try:
            while True:
                tmp = sp.call('clear', shell=True)
                f = Figlet(font='slant')
                print(f.renderText('User Dashboard'))
                for i in range(len(self.options)):
                    print('{}. {}'.format(i + 1, self.options[i]))
                repeat_and_error(self.choose_options)()
                print(self.curr_opt)
                if self.curr_opt == len(self.options):
                    return
                else:
                    self.functions[self.curr_opt - 1]()
        except ValueError as e:
            perror(e)
