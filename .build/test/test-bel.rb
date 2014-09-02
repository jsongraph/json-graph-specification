require 'json'
require 'json-schema'
require 'pathname'
require 'pp'
require 'minitest/autorun'
require 'minitest/unit'

class ExtTest < Minitest::Unit::TestCase

  def test_validate_schema
    root = Pathname(File.dirname(File.expand_path __FILE__)) + '..' + '..' + 'child-schemas'
    schema = JSON.parse File.read(root + 'bel-json-graph.schema.json')
    errors = JSON::Validator.fully_validate_schema(schema)

    assert errors.empty?, errors.join("\n")

    root = Pathname(File.dirname(File.expand_path __FILE__)) + '..' + '..'
    data = JSON.parse File.open(root + 'examples' + 'test.network.json', 'r:UTF-8', &:read)
    errors = JSON::Validator.fully_validate(schema, data, :insert_defaults => true, :errors_as_objects => true)

    if ENV['JGS_VERBOSE']
      puts "\n\nValidated JSON for example: examples/test.network.json"
      pp data
    end

    assert errors.empty?, errors.join("\n")
  end
end
# vim: ts=2 sts=2 sw=2
