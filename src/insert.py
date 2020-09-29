import syntax.syntax as syntax


def repeat_and_error(func, func2):
    def inner():
        if func2 is not None:
            func2()
        for _ in range(1, 5):
            func()
            if _ == 4:
                raise ValueError('NOOOOOO')

    return inner


class Species:
    vulnerability_enum = [
        'Extinct',
        'Extinct from Wild',
        'Critically Endangered',
        'Endangered',
        'Vulnerable',
        'Near Threatened',
        'Least Concern'
    ]

    def __init__(self):
        self.genus = None
        self.specific_name = None
        self.taxonomy_code = None
        self.name = None
        self.vulnerability = None
        self.average_lifespan = None

    def add(self):
        try:

            def sci_name():
                self.genus, self.specific_name = input("Enter the scientific Name of the Species:").split()
                if not syntax.empty(self.genus) and not syntax.empty(self.specific_name):
                    self.genus.to_lower()
                    self.specific_name.to_lower()
                    return
                else:
                    print("genus or specific name can't be null")

            def name():
                self.name = input("Enter the common name of the Species")
                if not syntax.empty(self.name):
                    return
                else:
                    print("Common name cannot be null")

            def taxon_code():
                self.taxonomy_code = input("Enter the taxonomy-code of the Species")
                if not syntax.empty(self.taxonomy_code):
                    if len(self.taxonomy_code) == 10:
                        return
                    else:
                        print("Must be of length 10")
                else:
                    print("taxonomy code cannot be null")

            def vulnerability_options():
                print("Choose one among the vulnerability statuses of the species")
                for i in range(len(self.vulnerability_enum)):
                    print('{}. {}'.format(i + 1, self.vulnerability_enum[i]))

            def vulnerability():
                self.vulnerability = int(input())
                if not syntax.empty(self.vulnerability):
                    self.vulnerability -= 1
                    if not syntax.validate_range(self.vulnerability, 0, len(self.vulnerability_enum)):
                        print("must be from one of the options")
                    else:
                        return
                else:
                    print("Enter a value")

            def life_span():
                self.average_lifespan = float(input())
                return

            val = repeat_and_error(sci_name, None)
            val()
            val = repeat_and_error(name, None)
            val()
            val = repeat_and_error(taxon_code, None)
            val()
            val = repeat_and_error(vulnerability(), vulnerability_options())
            val()
            val = repeat_and_error(life_span, None)
            val()

        except ValueError as e:
            print(e.args[0])


if __name__ == '__main__':
    a = Species()
    a.add()
