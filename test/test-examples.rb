require 'json'
require 'json-schema'
require 'test/unit'
require 'pathname'
 
class ExamplesTest < Test::Unit::TestCase

  def setup
    project_root = Pathname(File.dirname(File.expand_path __FILE__)) + '..'
    @schema = JSON.parse File.read(project_root + 'json-graph-schema.json')
    @examples = Dir[project_root + 'examples' + '*.json']
  end

  def test_examples
    @examples.each do |ex|
      data = JSON.parse File.open(ex, 'r:UTF-8', &:read)
      errors = JSON::Validator.fully_validate(@schema, data)

      assert errors.empty?, errors.join("\n")
    end
  end
end
# vim: ts=2 sts=2 sw=2
