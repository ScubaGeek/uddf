require_relative '../test_helper'

class TestUDDF < Minitest::Test

  def test_uddf_document
    assert_instance_of UDDF::Document, UDDF.new, %q{UDDF::Document.new does not produce a valid object}
  end

  def test_uddf_output
    doc = UDDF.new
    assert_respond_to doc, :to_uddf, %q{UDDF::Document doesn't respond to 'to_uddf'}
    assert_instance_of String, UDDF.new.to_xml, %q{UDDF#to_xml doesn't produce valid output}
  end
end

