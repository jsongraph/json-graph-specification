from jsonschema import FormatChecker, TypeChecker, exceptions, validators
import unittest
import json

# Test the schema validity itself
class SchemaTest(unittest.TestCase):

	def test_schema(self):

		with open('json-graph-schema_v2.json') as file:
			schema = file.readlines()

		schema = [x.strip() for x in schema]

		#

		# 		Draft7Validator.tes

		# making sure its not empty
		self.assertTrue(schema)

# 		schema = json.loads(schema)

		validator = validators.Draft7Validator(schema)

# 		validator = validators.Draft7Validator(json.loads(schema))

# 		self.assertIsInstance(
# 			validator,
# 			validators.Draft7Validator
# 		)


