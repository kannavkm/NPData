import datetime

from tabulate import tabulate

from src.classes.national_park import *
from .utils.utils import *


class ScientificInterface:
    study_type_enum = [
        'Case Study',
        'Correlational Study',
        'Experimental Study',
        'Longitudnal Study',
        'Clinical Trial Study'
    ]

    def __init__(self, db):
        self.db = db
        self.options = [
            'Get Demography of a Period',
            'Get studies done by a Researcher',
            'Get studies done in a National Park',
            'Get Studies by their type',
            'Get National Parks of a species',
            'Update Study Data',
            'Exit'
        ]
        self.functions = [
            self.getDemographyOfPeriod,
            self.getStudyByResearcher,
            self.getStudyByNationalPark,
            self.getStudyByType,
            self.getNationalParkofSpecies,
            self.updateData
        ]

        self.curr_opt = 0
        self.np = None
        self.study_type = None
        self.year_range = None
        self.genus = None
        self.specific_name = None

    def choose_options(self):
        self.curr_opt = int(input(
            'Enter the corresponding option for which activity you want to perform: '))
        if not syntax.validate_range(self.curr_opt, 1, len(self.options)):
            perror("must be from one of the options")
            return False
        else:
            return True

    def get_study_type_options(self):
        print("Choose one among the following studies: ")
        for i in range(len(self.study_type_enum)):
            print('{}. {}'.format(i + 1, self.study_type_enum[i]))

    def get_study_type(self):
        self.study_type = int(input('Choosing the following for study type: '))
        return perror(
            "Study type must be from one of the options") if not syntax.validate_range(
            self.study_type, 1, len(self.study_type_enum)) else True

    def get_year_range(self):
        self.year_range = input("Enter period in years (YYYY-YYYY): ")
        return perror("Invalid period") if not self.validate_year_range(
            self.year_range) else True

    def validate_year_range(self, year):
        try:
            y1, y2 = year.split('-')
            a = datetime.datetime(year=int(y1), month=1, day=1)
            a = datetime.datetime(year=int(y2), month=12, day=31)
            return True
        except ValueError:
            return False

    def getDemographyOfPeriod(self):

        print_header("Demography")

        repeat_and_error(self.get_year_range)()
        y1, y2 = self.year_range.split('-')

        query = " SELECT P.national_park, P.genus, P.specific_name," \
                " D.time_stamp, D.total_population, " \
                " D.average_lifespan from Demography D, Presence P " \
                " where time_stamp >= '{}-01-01'" \
                " and time_stamp <= '{}-12-31' " \
                " and D.presence_id = P.presence_id".format(y1, y2)

        rows = self.db.get_result(query)
        print("\n\nHere is the demography of this period: ")
        print(tabulate(rows, headers="keys", showindex="always",
                       tablefmt="fancy_grid"))

        input("\nPress ENTER to continue >> ")
        return

    def getStudyByNationalPark(self):

        print_header("Park Studies")
        self.np = NationalPark(self.db)
        self.np.get_national_park()
        query = " SELECT D.name, A.type, A.start_date, C.description, C.data_type from " \
                " Study A, Study_data B, Data C, Researcher D where A.national_park = '{}'" \
                " and A.study_id = B.study_id and B.data_id = C.data_id " \
                "and D.researcher_id = A.researcher ".format(
            self.np.unitcode)

        rows = self.db.get_result(query)
        print("\n\nHere's a list of studies in ", self.np.name)
        print(tabulate(rows, headers="keys", showindex="always",
                       tablefmt="fancy_grid"))

        input("\nPress ENTER to continue >> ")
        return

    def getStudyByResearcher(self):

        while True:
            print_header("Studies by Researchers")
            rows = self.db.get_result("SELECT * from Researcher")
            i = 0
            for row in rows:
                print('{}. {}'.format(i + 1, row['name']))
                i += 1

            row = int(input("Choose the serial number to select the Researcher: "))
            if not syntax.validate_range(row, 1, len(rows)):
                perror('Invalid Input. Please choose again!')
                continue
            query = "SELECT A.national_park, A.type, A.start_date, C.description, C.data_type" \
                    " from Study A, Study_data B, Data C, Researcher D where" \
                    " A.researcher = D.researcher_id and D.name = '{}' and" \
                    " A.study_id = B.study_id and B.data_id = C.data_id".format(
                rows[row - 1]["name"])

            table_rows = self.db.get_result(query)
            print("\n\nHere's a list of studies done by ", rows[row - 1]["name"])
            print(tabulate(table_rows, headers="keys", showindex="always",
                           tablefmt="fancy_grid"))

            input("\nPress ENTER to continue >> ")
            return

    def getStudyByType(self):
        print_header("Study Types")
        repeat_and_error(self.get_study_type, self.get_study_type_options)()
        query = "SELECT A.national_park, D.name, A.start_date, C.description, " \
                "C.data_type from Study A, Study_data B, Data C, Researcher D  where" \
                " A.study_id = B.study_id and B.data_id = C.data_id and" \
                " D.researcher_id = A.researcher and A.type = '{}'".format(
            self.study_type_enum[self.study_type - 1])

        rows = self.db.get_result(query)
        print("\n\nHere's a list of '{}' studies done ".format(
            self.study_type_enum[self.study_type - 1].split(' ')[0]))
        print(tabulate(rows, headers="keys", showindex="always",
                       tablefmt="fancy_grid"))
        input("\nPress ENTER to continue >> ")
        return

    def getNationalParkofSpecies(self):
        print_header("Species Report")
        genus = None
        spec_name = None

        while True:
            try:
                genus, spec_name = input(
                    "Enter the scientific name of the Species (format: genus specific name): ").split()
                genus = genus.lower()
                spec_name = spec_name.lower()
            except ValueError as e:
                print(e)

            query = " SELECT N.name, P.genus, P.specific_name, S.name, " \
                    " P.abundance, P.occurrence FROM National_Park N, Presence P, Species S" \
                    " WHERE N.unit_code = P.national_park AND " \
                    "(P.genus, P.specific_name) = (S.genus, S.specific_name)" \
                    " AND S.genus LIKE '%{}%' AND S.specific_name LIKE '%{}%'" \
                .format(genus, spec_name)

            rows = self.db.get_result(query)
            print(tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))

            ch = input("\nDo you want to know more? (y/n): ").lower()
            if ch != 'y':
                return
            print("\n\n")

    def updateData(self):

        while True:
            print_header("Update Data")
            data = self.db.get_result(
                "SELECT A.study_id, B.data_id, A.national_park, D.name, C.description from"
                " Study A, Study_data B, Data C, Researcher D where A.researcher = D.researcher_id"
                " and  A.study_id = B.study_id and B.data_id = C.data_id")

            print("Here is the list of Studies\n")

            i = 0
            for row in data:
                print('{}. {} by {} in ({})'.format(
                    i + 1, row['description'], row['name'], row['national_park']))
                i += 1

            row = int(input("\nChoose the serial number for data to update: "))
            if not syntax.validate_range(row, 1, len(data)):
                perror('Invalid Input. Please choose again!')
                continue

            newDes = input("Enter new Description: ")
            newLink = input("Enter new Data Link: ")
            newType = input("Enter new Data Type: ")

            ch = input("Are you sue you want to update? (y/n): ")
            if (ch != 'y'):
                return

            query = ["UPDATE Data SET description = '{}' , data_link = '{}', data_type = '{}'" \
                     " where data_id = {}".format(newDes, newLink, newType, data[row - 1]["data_id"])]

            self.db.execute_query(query)
            input("\nPress ENTER to Continue >> ")
            return

    def loop(self):
        try:
            while True:
                print_header('Scientific Interface')
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