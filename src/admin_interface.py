from src.classes.national_park import NationalPark


class AdminInterface:
    def __init__(self, db):
        self.national_park = NationalPark()
        self.db = db
        self.options = [
            'Get National Park Report',
            'Add new Species Data',
            'Add Employee',
            'Update Species Data',
            'Get Species Data',
            'Add new Service'
            'Service Info',
            'Exit'
        ]
        self.functions = [
            self.data_report,
            self.add_species,
            self.add_employee,
            self.update_species,
            self.add_researcher,
            self.get_demography,
            self.add_new_service,
            self.service_report,
        ]
        self.curr_opt = 0

    def loop(self):
        print("Enter the National Park Code")
        ans = input()
