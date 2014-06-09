require_relative '../test_helper'

class TestDocument < Minitest::Test

  def test_uddf_document_returns_valid_object
    assert_instance_of UDDF::Document, UDDF::Document.new, 'UDDF::Document#new does not return a valid object'
  end
end
