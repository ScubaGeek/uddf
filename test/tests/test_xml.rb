require_relative '../test_helper'

module UDDF
  class TestXml < Minitest::Test

    def test_xml_generate_fragment_method
      assert_respond_to XML, :generate_fragment, %q{UDDF::XML does not respond to #generate_fragment}
      assert_instance_of Nokogiri::XML::DocumentFragment, XML.generate_fragment { test{} }
                         %q{#generate_fragment doesn't produce a DocumentFragment}
    end

    def test_xml_verson_method
      assert_respond_to XML, :version, %q{UDDF::XML does not respond to #version}
      assert_equal Document::VERSION, XML.version, %q{UDDF::XML#version does not produce valid version}
    end

    # def test_document_header_is_valid
    #   skip
    #   document = Document.new
    #   assert_equal '<?xml version="1.0" encoding="UTF-8" ?>', document.header
    #   assert_equal Document::VERSION, document.version, %q{UDDF Document does not return a valid version}
    # end
  end
end
