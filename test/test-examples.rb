require 'json'
require 'json_schemer'
require 'pathname'
require 'minitest/autorun'
require 'minitest/unit'

class ExamplesTest < Minitest::Unit::TestCase

  def setup
    root      = Pathname(File.dirname(File.expand_path __FILE__)) + '..'
    @schema   = JSON.parse File.read(root + 'json-graph-schema.json')
    @examples = Dir[root + 'examples' + '*.json']
  end

  def test_examples
    @examples.each do |ex|
      puts "-------\nExample: #{ex}"
      data = JSON.parse File.open(ex, 'r:UTF-8', &:read)
      schemer = JSONSchemer.schema(@schema)
      
      assert schemer.valid?(data)
      errors = schemer.validate(data)
      assert errors.none?

    end
  end
end
# vim: ts=2 sts=2 sw=2
