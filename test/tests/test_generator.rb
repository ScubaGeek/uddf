require_relative '../test_helper'

module UDDF
  class TestGenerator < Minitest::Test

    def test_generator_responds_to_methods
      assert_respond_to Generator.new, :name, 'UDDF::Generator does not respond to #name'
      assert_respond_to Generator.new, :type, 'UDDF::Generator does not respond to #type'
      assert_respond_to Generator.new, :version, 'UDDF::Generator does not respond to #version'
      assert_respond_to Generator.new, :datetime, 'UDDF::Generator does not respond to #datetime'
    end

    def test_datetime_is_iso8601_format
      # 2014-06-09T20:39:34-04:00"
      assert_match /\-\d{2}T\d+:/, Generator.new.datetime,
                   %q{UDDF::Generator doesn't return ISO8601 time format}
    end

    def test_generator_to_xml_returns_xml
      assert_instance_of Nokogiri::XML::DocumentFragment, Generator.new.to_xml,
                         %q{UDDF::Generator#to_xml doesn't return an xml fragment}
    end

  end
end
