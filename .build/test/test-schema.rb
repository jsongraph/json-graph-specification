require 'json'
require 'json-schema'
require "test/unit"
 
class SchemaTest < Test::Unit::TestCase

  def test_validate_schema
    root = Pathname(File.dirname(File.expand_path __FILE__)) + '..' + '..'
    schema = JSON.parse File.read(root + 'json-graph-schema.json')
    errors = JSON::Validator.fully_validate_schema(schema)

    assert errors.empty?, errors.join("\n")
  end
end
# vim: ts=2 sts=2 sw=2
