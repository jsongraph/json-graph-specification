require 'json-schema'
require "test/unit"
 
class ValidateExamples < Test::Unit::TestCase

  def test_validate_schema
    puts Dir.pwd
    errors = JSON::Validator.fully_validate_schema('schema.json')
    puts errors
    assert errors.empty?
  end
end
# vim: ts=2 sts=2 sw=2
