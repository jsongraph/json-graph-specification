from jsonschema import validate
import glob
import unittest
import json

# Test examples against JGF
# JGF schema against the meta schema is validated implicitly by jsonschema
class SchemaTest(unittest.TestCase):

	def test_schema(self):

		with open('json-graph-schema_v2.json') as file:
			schema = json.load(file)

		for filename in glob.glob('examples/*.json'):

			with open('examples/car_graphs.json') as file:
				instance = json.load(file)

			validate(instance=instance, schema=schema)
			print('File {} is valid against v2 schema.'.format(filename))
