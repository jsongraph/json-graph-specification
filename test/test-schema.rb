require 'json'
require 'json_schemer'
require "minitest/autorun"
require "minitest/unit"

class SchemaTest < Minitest::Unit::TestCase

  def test_validate_schema
    root   = Pathname(File.dirname(File.expand_path __FILE__)) + '..'
    draft = JSON.parse File.read(root + 'test/json-schema-draft7.json')
    schema = JSON.parse File.read(root + 'json-graph-schema.json')

    schemer = JSONSchemer.schema(draft)
    assert schemer.valid?(schema)
    errors = schemer.validate(schema)
    assert errors.none?
  end
end
# vim: ts=2 sts=2 sw=2