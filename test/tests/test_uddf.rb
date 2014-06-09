require_relative '../test_helper'

class TestUDDF < Minitest::Test

  def test_to_uddf_xml_returns_xml_data
    assert_instance_of Nokogiri::XML::Document, Hash.new.to_uddf, 'to_uddf does not return XML object'
  end

  def test_uddf_document_returns_valid_object
    assert_instance_of UDDF::Document, UDDF::Document.new, 'UDDF::Document#new does not return a valid object'
  end
end
