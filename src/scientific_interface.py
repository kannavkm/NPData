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
            'exit'
        ]
        self.functions = [
            self.getDemographyOfPeriod,
            self.getStudyByResearcher,
            self.getStudyByNationalPark,
            self.getStudyByType,
            self.getNationalParkofSpecies,
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
        repeat_and_error(self.get_year_range)()
        y1, y2 = self.year_range.split('-')

        query = " SELECT P.national_park, P.genus, P.specific_name," \
                " D.time_stamp, D.total_population, " \
                " D.average_lifespan from Demography D, Presence P " \
                " where time_stamp >= '{}-01-01'" \
                " and time_stamp <= '{}-12-31' " \
                " and D.presence_id = P.presence_id".format(y1, y2)

        rows = self.db.get_result(query)
        print("Here is the demography of this period: ")
        print(tabulate(rows, headers="keys", showindex="always",
                       tablefmt="fancy_grid"))

        ans = input('Press ENTER to continue')

    def getStudyByNationalPark(self):

        print_header("Park Studies")
        self.np = NationalPark(self.db)
        self.np.get_national_park()
        query = " SELECT A.study_id, A.researcher, A.type, A.start_date, C.* from " \
                " Study A, Study_data B, Data C where A.national_park = '{}'" \
                " and A.study_id = B.study_id and B.data_id = C.data_id ".format(
            self.np.unitcode)

        rows = self.db.get_result(query)
        print("Here's a list of studies in ", self.np.name)
        print(tabulate(rows, headers="keys", showindex="always",
                       tablefmt="fancy_grid"))

        input('Press ENTER to continue')

    def getNationalParkofSpecies(self):

        print_header("Species Report")
        genus = None
        spec_name = None
        try:
            genus, spec_name = input(
                "Enter the scientific name of the Species (format: genus specific name): ").split(
                ' ')
            genus = genus.lower()
            spec_name = spec_name.lower()
        except ValueError as e:
            print(e)

        query = " SELECT N.name, P.genus, P.specific_name, P.nativeness, " \
                " P.abundance, P.occurrence FROM National_Park N, Presence P" \
                " WHERE N.unit_code = P.national_park " \
                " AND genus LIKE '%{}%' AND specific_name LIKE '%{}%'" \
            .format(genus, spec_name)

        rows = self.db.get_result(query)
        print(tabulate(rows, headers="keys",
                       showindex="always", tablefmt="fancy_grid"))
        input('Press ENTER to continue')

    def getStudyByResearcher(self):

        while True:
            print_header("Studies by Researchers")
            rows = self.db.get_result("SELECT * from Researcher")
            i = 0
            for row in rows:
                print('{}. {}'.format(i + 1, row['name']))
                i += 1

            row = int(
                input("Choose the serial number to select the Researcher: "))

            if not syntax.validate_range(row, 0, len(rows) - 1):
                perror('Invalid Input. Please choose again!')
                continue

            # print(row)

            query = "SELECT A.*,  C.* from Study A, Study_data B, Data C, Researcher D where" \
                    " A.researcher = D.researcher_id and D.name = '{}' and A.study_id = B.study_id " \
                    "and B.data_id = C.data_id".format(
                rows[row - 1]["name"])

            tablerows = self.db.get_result(query)
            print("Here's a list of studies done by ", rows[row - 1]["name"])
            print(tabulate(tablerows, headers="keys", showindex="always",
                           tablefmt="fancy_grid"))

            input("\nEnter any key to continue >> ")
            return

    def get_study_type_options(self):
        print("Choose one among the following studies: ")
        for i in range(len(self.study_type_enum)):
            print('{}. {}'.format(i + 1, self.study_type_enum[i]))

    def get_study_type(self):
        self.study_type = int(input('Choosing the following for study type: '))
        return perror(
            "Study type must be from one of the options") if not syntax.validate_range(
            self.study_type, 1, len(self.study_type_enum)) else True

    def getStudyByType(self):
        repeat_and_error(self.get_study_type, self.get_study_type_options)()
        query = "SELECT A.*,  C.* from Study A, Study_data B, Data C where" \
                " A.study_id = B.study_id and B.data_id = C.data_id" \
                " and A.type = '{}'".format(self.study_type_enum[self.study_type - 1])

        rows = self.db.get_result(query)
        print("Here's a list of studies done ")
        print(tabulate(rows, headers="keys", showindex="always",
                       tablefmt="fancy_grid"))
        input("\nEnter any key to continue >> ")
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
