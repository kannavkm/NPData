import datetime

from tabulate import tabulate

import src.utils.syntax_check as syntax
from src.classes import national_park
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
            'Get National Parks of a species'
        ]
        self.functions = [
            self.getDemographyOfPeriod,
            self.getStudyByNationalPark,
            self.getStudyByResearcher,
            self.getStudyByType,
            self.getNatonalParkofSpecies
        ]

        self.curr_opt = 0
        self.np = None
        self.study_type = None
        self.year_range = None
        self.genus = None
        self.specific_name = None

    def get_study_type_options(self):
        print("Choose one among the followinf studies: ")
        for i in range(len(self.study_type_enum)):
            print('{}. {}'.format(i + 1, self.study_type_enum[i]))

    def get_study_type(self):
        self.study_type(input('Choosing the following for study type: '))
        return perror("Study type must be from one of the options") if not syntax.validate_range(
            self.study_type, 1, len(self.study_type_enum)) else True

    def get_year_range(self):
        self.year_range = input("Enter period in years (YYYY-YYYY): ")
        return perror("Invalid period") if not self.validate_year_range(self.year_range) else True

    def validate_year_range(self, year):
        try:
            y1, y2 = year.split('-')
            a = datetime.datetime(year=int(y1), month=1, day=1)
            a = datetime.datetime(year=int(y2), month=12, day=31)
            return True
        except ValueError:
            return False

    def getDemographyOfPeriod(self):
        repeat_and_error(self.get_year_range)()
        y1, y2 = self.year_range.split('-')

        query = ["SELECT * from Demography where time_stamp >= '{}-01-01'"
                 " and time_stamp <= '{}-12-31'".format(y1, y2)]
        print(query)
        return query

    def getStudyByNationalPark(self):

        print_header("Park Studies")
        self.np = national_park().get_national_park()
        query = "SELECT A.study_id, A.researcher, A.type, A.start_date, C.* from " \
                "Study A, Study_data B, Data C where A.national_park = '{}'" \
                " and A.study_id = B.study_id and B.data_id = C.data_id ".format(self.np.unitcode)

        rows = self.db.get_result(query)
        print("Here's a list of studies in ", self.national_park.name)
        print(tabulate.tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))

    def getNationalParkofSpecies(self):

        print_header("Species Report")
        genus = ''
        spec_name = ''
        try:
            genus, spec_name = input(
                "Enter the scientific name of the Species (format: genus specific name): ").split(' ')
            genus = genus.lower()
            spec_name = spec_name.lower()
        except ValueError as e:
            print(e)

        query = " SELECT N.name, P.genus, P.specific_name, P.nativeness, " \
                " P.abundance, P.occurence FROM National_Park N, Presence P" \
                " WHERE N.unit_code = P.national_park " \
                " AND genus LIKE '%{}%' AND specific_name LIKE '%{}%'" \
            .format(self.genus, self.specific_name)

        rows = self.db.get_result(query)
        print(tabulate(rows, headers="keys",
                       showindex="always", tablefmt="fancy_grid"))
        ans = input('Press ENTER to continue')

    def Update_demography(self):

        print_header("Update Census")
        self.np = national_park().get_national_park()
        query = """
                    UPDATE Demography 
                    SET {} = {}, time_stamp = '{}' WHERE presence_id IN
                    (SELECT presence_id FROM Presence WHERE 
                    national_park = '{}' AND genus = '{}' AND specific_name = '{}')
                """.format(self.options[self.ch - 1], self.newvalue,
                           datetime.datetime.now(), self.national_park,
                           self.genus, self.specific_name)

        self.db.execute_query(query)
        ans = input('Press ENTER to continue')

    def getStudyByResearcher(self):

        while True:
            print_header("Studies by Researchers")
            rows = self.db.get_result("SELECT * from Researcher")
            i = 0
            for row in rows:
                print('{}. {} ({})'.format(i + 1, row['name']))
                i += 1

            row = int(input("Choose the serial number to select the Researcher: "))
            if not syntax.validate_range(row, 0, len(rows) - 1):
                perror('Invalid Input. Please choose again!')
                continue

            query = "SELECT A.*,  C.* from Study A, Study_data B, Data C, Researcher D where" \
                    " A.researcher = D.researcher_id and D.name = '{}' and A.study_id = B.study_id " \
                    "and B.data_id = C.data_id".format(self.rows[row - 1]["researcher_id"])

            rows = self.db.get_result(query)
            print("Here's a list of studies done by ", self.rows[row - 1]["name"])
            print(tabulate.tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))

            input("\nEnter any key to continue >> ")
            return

    def getStudyByType(self):
        repeat_and_error(self.get_study_type, self.study_type_enum)()
        query = ["SELECT A.*,  C.* from Study A, Study_data B, Data C where" \
                 " A.study_id = B.study_id and B.data_id = C.data_id" \
                 " and A.type = '{}'".format(self.study_type)]

        rows = self.db.get_result(query)
        print("Here's a list of studies done by ", self.rows[self.study_type - 1]["name"])
        print(tabulate.tabulate(rows, headers="keys", showindex="always", tablefmt="fancy_grid"))
        input("\nEnter any key to continue >> ")
        return
