import src.utils.syntax_check as syntax
from src.utils.utils import repeat_and_error


class Species:
    vulnerability_enum = [
        'Extinct',
        'Extinct from Wild',
        'Critically Endangered',
        'Endangered',
        'Vulnerable',
        'Near Threatened',
        'Least Concern',
        'Data Deficient'
    ]

    def __init__(self):
        self.genus = None
        self.specific_name = None
        self.taxonomy_code = None
        self.name = None
        self.vulnerability = None
        self.average_lifespan = None

    def get_sci_name(self):
        self.genus, self.specific_name = input("Enter the scientific Name of the Species:").split()
        if not syntax.empty(self.genus) and not syntax.empty(self.specific_name):
            self.genus = self.genus.lower()
            self.specific_name = self.specific_name.lower()
            return True
        else:
            print("genus or specific name can't be null")
        return False

    def get_name(self):
        self.name = input("Enter the common name of the Species:")
        if not syntax.empty(self.name):
            return True
        else:
            print("Common name cannot be null")
        return False

    def get_taxon_code(self):
        self.taxonomy_code = input("Enter the taxonomy-code of the Species:")
        if not syntax.empty(self.taxonomy_code):
            if len(self.taxonomy_code) == 10:
                return True
            else:
                print("Must be of length 10")
        else:
            print("taxonomy code cannot be null")
        return False

    def vulnerability_options(self):
        print("Choose one among the vulnerability statuses of the species:")
        for i in range(len(self.vulnerability_enum)):
            print('{}. {}'.format(i + 1, self.vulnerability_enum[i]))

    def get_vulnerability(self):
        self.vulnerability = int(input('Enter the corresponding option for the vulnerability status of the species:'))
        self.vulnerability -= 1
        if not syntax.validate_range(self.vulnerability, 0, len(self.vulnerability_enum)):
            print("must be from one of the options")
        else:
            return True

    def get_life_span(self):
        self.average_lifespan = float(input('Enter the average lifespan in years, negative if unknown:'))
        if self.average_lifespan < 0:
            self.average_lifespan = 'NULL'
        return True

    def add(self):
        try:
            repeat_and_error(self.get_sci_name, None)()
            repeat_and_error(self.get_name, None)()
            repeat_and_error(self.get_taxon_code, None)()
            repeat_and_error(self.get_vulnerability, self.vulnerability_options)()
            repeat_and_error(self.get_life_span, None)()

            q = []

            query = "INSERT INTO Kingdom_classification(kingdom, class) values()"

            q.append(query)

            query = "INSERT INTO Species(genus, specific_name, taxonomy_code, name, vulnerability, average_lifespace)" \
                    "VALUES('{}', '{}', '{}', '{}', {})".format(self.genus, self.specific_name, self.taxonomy_code,
                                                                self.vulnerability, self.average_lifespan)

            q.append(query)

            return query

        except ValueError as e:
            print(e.args[0])
