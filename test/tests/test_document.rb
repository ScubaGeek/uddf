require_relative '../test_helper'

module UDDF
  class TestDocument < Minitest::Test
    def setup
      @uddf_regex = /<uddf version=\"#{Document::VERSION}\">.*<generator>.*<\/generator>.*<\/uddf>/m
    end

    def test_document
      assert_instance_of Document, Document.new, %q{UDDF::Document.new does not produce a valid object}
    end

    def test_document_output_to_uddf
      doc = Document.new.to_uddf
      refute_match /^<\?xml version=\"1.0\" encoding=\"UTF-8\"\?>\n/, doc
      assert_match @uddf_regex, doc
    end

    def test_document_output_to_xml
      doc = Document.new.to_xml
      assert_match /^<\?xml version=\"1.0\" encoding=\"UTF-8\"\?>\n/, doc
      assert_match @uddf_regex, doc
    end

  end
end

