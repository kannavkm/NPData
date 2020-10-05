import src.utils.syntax_check as syntax
from src.utils.utils import *


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

	def __init__(self, db):
		self.genus = None
		self.specific_name = None
		self.taxonomy_code = None
		self.name = None
		self.vulnerability = None
		self.average_lifespan = None
		self.kingdom = None
		self._class = None
		self.order = None
		self.family = None
		self.db = db

	def get_sci_name(self):
		self.genus, self.specific_name = input(
			"Enter the scientific Name of the Species(genus, specific name):").split()
		if not syntax.empty(self.genus) and not syntax.empty(self.specific_name):
			self.genus = self.genus.lower()
			self.specific_name = self.specific_name.lower()
			return True
		else:
			perror("genus or specific name can't be null")
		return False

	def get_name(self):
		self.name = input("Enter the common name of the Species:")
		if not syntax.empty(self.name):
			self.name = self.name.lower()
			return True
		else:
			perror("Common name cannot be null")
		return False

	def get_taxon_code(self):
		self.taxonomy_code = input("Enter the taxonomy-code of the Species:")
		if not syntax.empty(self.taxonomy_code):
			if len(self.taxonomy_code) == 10:
				return True
			else:
				perror("Must be of length 10")
		else:
			perror("taxonomy code cannot be null")
		return False

	def vulnerability_options(self):
		print("Choose one among the vulnerability statuses of the species:")
		for i in range(len(self.vulnerability_enum)):
			print('{}. {}'.format(i + 1, self.vulnerability_enum[i]))

	def get_vulnerability(self):
		self.vulnerability = int(
			input('Enter the corresponding option for the vulnerability status of the species:'))
		if not syntax.validate_range(self.vulnerability, 1, len(self.vulnerability_enum)):
			perror("must be from one of the options")
		else:
			return True

	def get_taxon_information(self):
		self.kingdom, self._class, self.order, self.family = input(
			'Enter the kingdom, class, order and family of the species:').split()
		self.kingdom = self.kingdom.lower()
		self._class = self._class.lower()
		self.order = self.order.lower()
		self.family = self.family.lower()
		return True

	def get_life_span(self):
		self.average_lifespan = float(
			input('Enter the average lifespan in years, negative if unknown:'))
		if self.average_lifespan < 0:
			self.average_lifespan = 'NULL'
		return True

	def add(self):
		try:
			repeat_and_error(self.get_sci_name)()
			repeat_and_error(self.get_name)()
			repeat_and_error(self.get_taxon_information)()
			repeat_and_error(self.get_taxon_code)()
			repeat_and_error(self.get_vulnerability, self.vulnerability_options)()
			repeat_and_error(self.get_life_span)()

			q = []

			rows = self.db.get_result("SELECT * FROM Kingdom_classification where class = '{}'".format(self._class))

			if syntax.empty(rows):
				query = "INSERT INTO Kingdom_classification(kingdom, class) values('{}', '{}')".format(
					self.kingdom,
					self._class)
				q.append(query)

			rows = self.db.get_result("SELECT * FROM Class_classification where `order` = '{}'".format(self.order))

			if syntax.empty(rows):
				query = "INSERT INTO Class_classification(class, `order`) values('{}', '{}')".format(
					self._class,
					self.order)
				q.append(query)

			rows = self.db.get_result("SELECT * FROM Order_classification where family = '{}'".format(self.family))

			if syntax.empty(rows):
				query = "INSERT INTO Order_classification(`order`, family) values('{}', '{}')".format(
					self.order,
					self.family)
				q.append(query)

			rows = self.db.get_result("SELECT * FROM Family_classification where genus = '{}'".format(self.genus))

			if syntax.empty(rows):
				query = "INSERT INTO Family_classification(family, genus) values('{}', '{}')".format(
					self.family,
					self.genus)
				q.append(query)

			query = "INSERT INTO Species(genus, specific_name, taxonomy_code, name," \
					" vulnerability, average_lifespan)" \
					"VALUES('{}', '{}', '{}', '{}', '{}', {})".format(self.genus, self.specific_name,
																	  self.taxonomy_code, self.name,
																	  self.vulnerability,
																	  self.average_lifespan)
			q.append(query)

			return q

		except ValueError as e:
			perror(e.args[0])


class Presence:
	abundance_enum = [
		'Rare',
		'Common',
		'Uncommon'
	]

	record_status_enum = [
		'Verified',
		'Non Verified'
	]

	occurrence_enum = [
		'Full Year',
		'Seasonal'
	]

	def __init__(self):
		self.nativeness = None
		self.is_attraction = None
		self.abundance = None
		self.record_status = None
		self.record_date = None
		self.occurrence = None

	def get_nativeness(self):
		spicyfood = input("Is the species native? True or False?")
		if spicyfood == "True":
			self.nativeness = True
			return True
		if spicyfood == "False":
			self.nativeness = False
			return True
		return False

	def get_attraction(self):
		spicyfood = input("Is the species an attraction(True or False)")
		if spicyfood == "True":
			self.is_attraction = True
			return True
		if spicyfood == "False":
			self.is_attraction = False
			return True
		return False

	def abundance_options(self):
		print("Choose one among the abundance statuses of the species:")
		for i in range(len(self.abundance_enum)):
			print('{}. {}'.format(i + 1, self.abundance_enum[i]))

	def get_abundance(self):
		self.abundance = int(
			input('Enter the corresponding option for the abundance status of the species:'))

	def record_status_options(self):
		print("Choose one among the record statuses of the species:")
		for i in range(len(self.record_status_enum)):
			print('{}. {}'.format(i + 1, self.record_status_enum[i]))

	def get_record_status(self):
		self.record_status = int(
			input('Enter the corresponding option for the record status of the species:'))

	def get_record_date(self):
		self.record_date = input("Enter Record Date (YYYY-MM-DD): ")

	def occurrence_options(self):
		print("Choose one among the occurrence values of the species:")
		for i in range(len(self.occurrence_enum)):
			print('{}. {}'.format(i + 1, self.occurrence_enum[i]))

	def get_occurrence(self):
		self.occurrence = int(
			input('Enter the corresponding option for the occurrence values of the species:'))

	def add(self):
		try:
			ask(self.get_nativeness)()
			ask(self.get_record_status, self.record_status_options)()
			ask(self.get_attraction)()
			ask(self.get_abundance, self.abundance_options)()
			ask(self.get_record_date)()
			ask(self.get_occurrence, self.occurrence_options)()

			if self.record_status is not None:
				self.record_status = self.record_status_enum[self.record_status]

			if self.abundance is not None:
				self.abundance = self.abundance_enum[self.abundance]

			if self.occurrence is not None:
				self.occurrence = self.occurrence_enum[self.occurrence]

		except ValueError as e:
			perror(e.args[0])
