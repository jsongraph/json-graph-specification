from jsonschema import validate
import os
import ntpath
import glob
import unittest
import json

__location__ = os.path.realpath(os.path.join(os.getcwd(), os.path.dirname(__file__)))

# Test examples against JGF
# JGF schema against the meta schema is validated implicitly by jsonschema
class SchemaTest(unittest.TestCase):

	def test_schema(self):

		with open(__location__ + '/../json-graph-schema_v2.json') as file:
			schema = json.load(file)

		for filename in glob.glob(__location__ + '/../examples/*.json'):

			with open(filename) as file:
				instance = json.load(file)

			validate(instance=instance, schema=schema)

			prettyname = ntpath.basename(filename)
			print('File {} is valid against v2 schema.'.format(prettyname))
