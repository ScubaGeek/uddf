require_relative '../test_helper'

class TestDocument < Minitest::Test

  def test_uddf_document_returns_valid_object
    assert_instance_of UDDF::Document, UDDF::Document.new, 'UDDF::Document#new does not return a valid object'
  end

  def test_document_header_is_valid
    document = UDDF::Document.new
    assert_equal '<?xml version="1.0" encoding="UTF-8" ?>', document.header
    assert_equal UDDF::Document::VERSION, document.version, %q{UDDF Document does not return a valid version}
  end
end
