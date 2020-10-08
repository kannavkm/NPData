from src.utils.utils import *


class NationalPark:

    def __init__(self, db):
        self.db = db
        self.chosen = None
        self.unitcode = None
        self.name = None
        self.region_code = None
        self.boundary = None
        self.latitude = None
        self.longitude = None

    def get_chosen(self):
        self.chosen = int(input('Enter the corresponding option for the National Park you have chosen: '))
        return True

    def get_national_park(self):

        while True:
            rows = self.db.get_result("SELECT * from National_Park")
            i = 0
            for row in rows:
                print('{}. {} ({})'.format(i + 1, row['name'], row['unit_code']))
                i += 1
            repeat_and_error(self.get_chosen)()
            if not syntax.validate_range(self.chosen, 1, len(rows)):
                perror('Invalid Input. Please choose again!\n\n\n')
                continue

            ch = input("Are you sure to choose {} (y/n): ".format(rows[self.chosen - 1]["name"])).lower()
            if ch == "y":
                self.unitcode = rows[self.chosen - 1]["unit_code"]
                self.name = rows[self.chosen - 1]["name"]
                self.region_code = rows[self.chosen - 1]["region_code"]
                self.boundary = rows[self.chosen - 1]["boundary"]
                self.latitude = rows[self.chosen - 1]["latitude"]
                self.longitude = rows[self.chosen - 1]["longitude"]
                return
            print("")
