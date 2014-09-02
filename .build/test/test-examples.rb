require 'json'
require 'json-schema'
require 'pathname'
require 'minitest/autorun'
require 'minitest/unit'

class ExamplesTest < Minitest::Unit::TestCase

  def setup
    root = Pathname(File.dirname(File.expand_path __FILE__)) + '..' + '..'
    @schema = JSON.parse File.read(root + 'json-graph-schema.json')
    @examples = Dir[root + 'examples' + '*.json']
  end

  def test_examples
    @examples.each do |ex|
      data = JSON.parse File.open(ex, 'r:UTF-8', &:read)
      errors = JSON::Validator.fully_validate(@schema, data, :insert_defaults => true)

      if ENV['JGS_VERBOSE']
        puts "\n\nValidated JSON for example: #{ex}"
        pp data
      end

      assert errors.empty?, errors.join("\n")
    end
  end
end
# vim: ts=2 sts=2 sw=2
