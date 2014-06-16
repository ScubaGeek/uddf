require_relative '../test_helper'

module UDDF

  class TestXML < Minitest::Test

    def test_xml_verson_method
      assert_respond_to XML, :version, %q{UDDF::XML does not respond to #version}
      assert_equal Document::VERSION, XML.version, %q{UDDF::XML#version does not produce valid version}
    end

    def test_invalid_to_elem
      assert_raises ArgumentError do
        UDDF::XML.to_elem(String, [:bogus_method])
      end
    end

    def test_xml_to_elem
      doc = UDDF::XML.to_elem(String, [:name])
      assert_instance_of Ox::Element, doc
      assert_match /^<class>\n\s*<name>.*<\/name>\n\s*<\/class>$/m, Ox.dump(doc)
    end

  end
end
