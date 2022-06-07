require_relative "../test_helper"

class XMLTestValid < UDDF::Base
  def nodename
    "testing"
  end

  def nodes
    { name: "test" }
  end
end

class XMLTestInvalidNodes < UDDF::Base
  def nodes
    "test"
  end
end

class XMLTestInvalidNodename < UDDF::Base
  def nodename; end
end

class XMLTestInvalid
  # This class intentionally left blank
end

module UDDF
  class TestXML < Minitest::Test
    def test_xml_verson_method
      assert_respond_to XML, :version, "UDDF::XML does not respond to #version"
      assert_equal Document::VERSION, XML.version, "UDDF::XML#version does not produce valid version"
    end

    def test_xml_raises_argument_error_on_missing_methods
      assert_raises ArgumentError, "XML#to_elem doesn't raise ArguementError when klass doesn't respond to nodes or nodename" do
        UDDF::XML.to_elem(XMLTestInvalid.new)
      end
    end

    def test_xml_raises_runtime_error_for_invalid_nodes
      assert_raises RuntimeError, "does not raise RuntimeError when nodes doesn't return Hash" do
        XML.to_elem(XMLTestInvalidNodes.new)
      end
    end

    def test_xml_raises_argument_error_for_invalid_nodename
      assert_raises ArgumentError, "does not raise ArgumentError when nodename doesn't exist" do
        XML.to_elem(XMLTestInvalidNodename.new)
      end
    end

    def test_xml_to_elem
      doc = XML.to_elem(XMLTestValid.new)
      assert_instance_of Ox::Element, doc
      assert_match(%r{^<testing>\n\s*<name>test</name>\n\s*</testing>}, Ox.dump(doc))
    end
  end
end
