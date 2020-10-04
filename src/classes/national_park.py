class NationalPark:

    def __init__(self):
        self.unitcode = None
        self.name = None
        self.region_code = None
        self.boundary = None
        self.latitude = None
        self.longitude = None

    def add(self):
        print("Enter National Park's details: ")

        def getunitcode():
            self.unitcode = int(input("Enter unitcode: "))

        self.name = input("Enter Name: ").lower()
        self.region_code = input("Enter Region code: ").lower()
        self.boundary = input("Enter Boundary: ")
        self.latitude = float(input("Enter latitude: "))
        self.longitude = float(input("Enter longitude: "))

        query = """INSERT INTO National_Park(unit_code, name, region_code, boundary, latitude, longitude) 
        VALUES(%s, %s, %s, st_polyfromtext('polygon(%s)') , %s, %s)"""

        values = (self.unitcode, self.name, self.region_code, self.boundary, self.latitude, self.longitude)

        return query.format(values)
