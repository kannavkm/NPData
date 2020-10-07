import src.utils.syntax_check as syntax
from src.utils.utils import perror


class NationalPark:

    def __init__(self, db):
        self.db = db
        self.unitcode = None
        self.name = None
        self.region_code = None
        self.boundary = None
        self.latitude = None
        self.longitude = None

    def get_national_park(self):

        while True:
            rows = self.db.get_result("SELECT * from National_Park")
            i = 0
            for row in rows:
                print('{}. {} ({})'.format(i + 1, row['name'], row['unit_code']))
                i += 1

            row = int(input("Please enter the corresponding number to access National Park: "))
            if not syntax.validate_range(row, 1, len(rows)):
                perror('Invalid Input. Please choose again!')
                continue

            ch = input("Are you sure to choose {} (y/n)".format(rows[row - 1]["name"])).lower()
            if ch == "y":
                self.unitcode = rows[row - 1]["unit_code"]
                self.name = rows[row - 1]["name"]
                self.region_code = rows[row - 1]["region_code"]
                self.boundary = rows[row - 1]["boundary"]
                self.latitude = rows[row - 1]["latitude"]
                self.longitude = rows[row - 1]["longitude"]
                return
            print("")
