require 'json'
require 'json-schema'
require "test/unit"
 
class ValidateExamples < Test::Unit::TestCase

  def test_validate_schema
    schema = JSON.parse File.read('json-graph-schema.json')
    errors = JSON::Validator.fully_validate_schema(schema)
    assert errors.empty?, errors.join("\n")
  end
end
# vim: ts=2 sts=2 sw=2
