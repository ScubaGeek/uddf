require_relative '../test_helper'

module UDDF
  class TestGenerator < Minitest::Test

    def test_generator_responds_to_methods
      gen = Generator.new

      assert_respond_to gen, :nodename, 'UDDF::Generator does not respond to #nodename'
      assert_respond_to gen, :nodes,    'UDDF::Generator does not respond to #nodes'
      assert_instance_of Hash, gen.nodes,     'UDDF::Generator#nodes is not a Hash'
    end

    def test_datetime_is_iso8601_format
      # 2014-06-09T20:39:34-04:00"
      assert_match /\-\d{2}T\d+:/, Generator.new.nodes[:datetime],
                   %q{UDDF::Generator doesn't return ISO8601 time format}
    end

    def test_generator_nodes
      assert_equal [ :name, :type, :version, :datetime ], Generator.new.nodes.keys
    end

    def test_to_elem
      doc = Generator.new
      assert_respond_to doc, :to_elem, %q{UDDF::Generator#to_elem is not valid}
      assert_instance_of Ox::Element, doc.to_elem
    end

  end
end
