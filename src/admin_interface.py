from tabulate import tabulate

from src.classes.employee import *
from src.classes.national_park import NationalPark
from src.classes.species import Species, Presence
from src.utils.utils import *


class AdminInterface:
    def __init__(self, db):
        self.db = db
        self.national_park = NationalPark(db)
        self.options = [
            'Get National Park Report',
            'Modify/Add Species Data',
            'Add Employee',
            'Add Species Data',
            'Service Information',
            'Exit'
        ]
        self.functions = [
            self.data_report,
            self.add_species,
            self.add_employee,
            self.add_demography,
            self.service_info_report,
        ]
        self.curr_opt = 0

    def choose_options(self):
        self.curr_opt = int(input('Enter the corresponding option for which activity you want to perform: '))
        if not syntax.validate_range(self.curr_opt, 1, len(self.options)):
            perror("must be from one of the options")
            return False
        else:
            return True

    def data_report(self):
        print_header("Park Report")
        print("Here is the current park report of {}".format(self.national_park.name))

        query = "SELECT DISTINCT S.genus, S.specific_name, S.name, S.average_lifespan, P.abundance, " \
                "P.current_population FROM Presence P, Species S WHERE " \
                "(S.genus, S.specific_name) = (P.genus, P.specific_name)" \
                " AND P.national_park = '{}'".format(self.national_park.unitcode)
        rows = self.db.get_result(query)
        print(tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))
        ans = input('Press ENTER to continue')

    def add_species(self):
        print_header('Species')
        genus = ''
        spec_name = ''
        try:
            genus, spec_name = input(
                "Enter the scientific name of the Species (format: genus specific name): ").split()
            genus = genus.lower()
            spec_name = spec_name.lower()
        except ValueError as e:
            print(e)

        qq = "SELECT * FROM Species WHERE genus = '{}' AND specific_name = '{}'".format(genus, spec_name)

        rows = self.db.get_result(qq)

        if syntax.empty(rows):
            print_header('New Species')
            print("This is a new species, Kindly enter the complete details of the species")
            temp = Species(self.db)
            q = temp.add()
            self.db.execute_query(q)

        qq = "SELECT * FROM Presence WHERE genus = '{}' AND specific_name = '{}' AND" \
             " national_park = '{}'".format(genus, spec_name, self.national_park.unitcode)
        rows = self.db.get_result(qq)

        if len(rows) > 0:
            ans = input("That species is already recorded in {} would you like to update the status(y/n)".format(
                self.national_park.unitcode))
            if ans == "y":
                presence = Presence()
                presence.update(rows[0])

                qq = "UPDATE Presence SET record_status = {}, abundance = {}, occurrence = {}" \
                     " , current_population = {} WHERE genus = {} and specific_name = {} and national_park = {}". \
                    format(f(presence.record_status),
                           f(presence.abundance),
                           f(presence.occurrence),
                           f(presence.current_population),
                           f(genus),
                           f(spec_name),
                           f(self.national_park.unitcode))
                self.db.execute_query([qq])
                ans = input('Press ENTER to continue')
            return

        print_header('Report Species')
        print(
            'Kindly enter the details of the species {} {} in the {} \n, press enter on empty string to put NULL'.format(
                genus, spec_name, self.national_park.name))

        presence = Presence()
        presence.add()

        qq = "INSERT INTO Presence(genus, specific_name, national_park, nativeness, is_attraction," \
             " abundance, record_status, record_time, occurrence) VALUES ({}, {}, {}, {}, {}, {}," \
             " {}, {}, {})".format(f(genus),
                                   f(spec_name),
                                   f(self.national_park.unitcode),
                                   f(presence.nativeness),
                                   f(int(presence.is_attraction)),
                                   f(presence.abundance),
                                   f(presence.record_status),
                                   f(presence.record_date),
                                   f(presence.occurrence)
                                   )
        self.db.execute_query([qq])
        ans = input('Press ENTER to continue')

    def add_employee(self):
        print_header("Add Employee")
        emp = Employee(self.db, self.national_park).hire
        self.db.execute_query(emp())
        ans = input('Press ENTER to continue')

    def add_demography(self):

        print_header("Update Census")
        genus = None
        spec_name = None
        newvalue = None
        try:
            genus, spec_name = input("Enter the scientific name of the Species (format: genus specific name): ").split()
            qq = "SELECT presence_id FROM Presence WHERE genus = '{}' AND specific_name = '{}' AND" \
                 " national_park = '{}'".format(genus, spec_name, self.national_park.unitcode)
            rows = self.db.get_result(qq)

            if len(rows) > 0:
                target_presence = rows['presence_id']
                qq = "UPDATE Presence SET current_population = {} " \
                     "WHERE national_park = '{}' AND genus = '{}' AND specific_name = '{}') " \
                    .format(newvalue, self.national_park, genus, spec_name)

        except ValueError as e:
            print(e)

        ans = input('Press ENTER to continue')

    def service_info_report(self):
        print_header("Service Report")
        query = "SELECT B.service_id, C.name, sum(A.price) " \
                "from Booking_service A, Sub_service B, Services C  " \
                "where A.sub_service_id = B.sub_service_id and " \
                "B.service_id = C.service_id and C.provided_by = '{}'" \
                " GROUP BY B.service_id ORDER BY sum(A.price) DESC".format(
            self.national_park.unitcode)
        rows = self.db.get_result(query)
        print(tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))
        ans = input('Press ENTER to continue')

    def loop(self):
        print_header('Admin Interface')
        self.national_park.get_national_park()

        try:
            while True:
                print_header('Admin Interface')
                for i in range(len(self.options)):
                    print('{}. {}'.format(i + 1, self.options[i]))
                repeat_and_error(self.choose_options)()
                print(self.curr_opt)
                if self.curr_opt == len(self.options):
                    return
                else:
                    self.functions[self.curr_opt - 1]()
        except ValueError as e:
            perror(e.args[0])
