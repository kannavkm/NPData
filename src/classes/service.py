import src.utils.syntax_check as syntax
from src.utils.utils import repeat_and_error, perror


class Services:

    def __init__(self):
        self.service_id = None
        self.name = None
        self.availability = None
        self.capacity = None
        self.price = None
        self.description = None
        self.provided_by = None

    def get_id(self):
        self.service_id = int(input("Enter Service ID: "))
        return True

    def get_name(self):
        self.name = input("Enter the Name of the Service: ").lower()
        return perror("Name cannot be empty") if syntax.empty(self.name) else True

    def get_availability(self):
        self.availability = int(input("Enter the Availability of Service: "))
        return True

    def get_capacity(self):
        self.capacity = int(input("Enter the Capacity for Service: "))
        return True

    def get_price(self):
        self.price = float(input("Enter the price for Service: "))
        return True

    def get_description(self):
        self.description = input("Enter description of the Service: ").lower()
        return perror("Description cannot be empty") if syntax.empty(self.description) else True

    def get_national_park(self):
        self.provided_by = int(
            input("Enter the Code of National Park: "))
        return True

    def add(self):

        try:
            print("Enter details of new Service: ")
            repeat_and_error(self.get_id)()
            repeat_and_error(self.get_name)()
            repeat_and_error(self.get_availability)()
            repeat_and_error(self.get_capacity)()
            repeat_and_error(self.get_price)()
            repeat_and_error(self.get_description)()
            repeat_and_error(self.get_national_park)()

            query = []
            query.append(
                "INSERT INTO Services(service_id, name, availability, capacity, price,description," \
                "provided_by) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}')".format(
                    self.service_id, self.name, self.availability, self.capacity, self.price,
                    self.description, self.provided_by))

            print(query)
            return query
        except ValueError as e:
            print(e.args[0])

    def remove(self):
        print("Enter Service details for removal: ")
        self.service_id = int(input("Service ID: "))
        self.provided_by = int(input("Provided by which National Park: "))

        query = "DELETE from Services WHERE (contained_in = %s and service_id = %s)"
        values = (self.provided_by, self.service_id)
        print(query, values)
        return [query, values]


class ServiceTimings:
    day_enum = [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
    ]

    def __init__(self):
        self.sub_service_id = None
        self.service_id = None
        self.timings = None
        self.day_of_service = None

    def get_ssid(self):
        self.sub_service_id = int(input("Enter a new ID to deploy timings: "))
        return True

    def get_sid(self):
        self.service_id = int(input("Enter ID of service to choose timings for: "))
        return True

    def get_day_options(self):
        print("Choose one among the following days: ")
        for i in range(len(self.day_enum)):
            print('{}. {}'.format(i + 1, self.day_enum[i]))

    def get_day(self):
        self.day_of_service = int(input('Choose a day for service: '))
        return perror("Day must be from one a feedback for a featureof the options") if \
            not syntax.validate_range(self.day_of_service, 1, len(self.day_enum)) else True

    def get_time(self):
        self.timings = input('Enter the timings for service for above day(HH:MM:SS): ')
        return perror("Invalid Time") if not syntax.validate_time(self.timings) else True

    def add(self):

        try:
            print("Enter details for Service timings: ")
            repeat_and_error(self.get_ssid)()
            repeat_and_error(self.get_sid)()
            repeat_and_error(self.get_day, self.get_day_options)()
            repeat_and_error(self.get_time)()

            query = []
            query.append("INSERT INTO Service_timings(sub_service_id, service_id, day_of_service" \
                         " timings) VALUES ('{}', '{}', '{}', '{}')".format(
                self.sub_service_id, self.service_id, self.day_of_service, self.timings))

            print(query)
            return query
        except ValueError as e:
            print(e.args[0])


class ServiceFeature:

    def __init__(self):
        self.service_id = None
        self.feature_id = None

    def get_sid(self):
        self.service_id = int(input("Enter ID of service: "))
        return True

    def get_fid(self):
        self.feature_id = int(input("Enter ID of feature related to service: "))
        return True

    def add(self):

        try:
            print("Enter details for Service timings: ")
            repeat_and_error(self.get_fid)()
            repeat_and_error(self.get_sid)()

            query = []
            query.append("INSERT INTO Service_timings(feature_id, service_id)" \
                         " timings) VALUES ('{}', '{}')".format(self.feature_id, self.service_id))
            print(query)
            return query
        except ValueError as e:
            print(e.args[0])
