require_relative '../test_helper'

module UDDF
  class TestDocument < Minitest::Test

    def test_document
      assert_instance_of Document, Document.new, %q{UDDF::Document.new does not produce a valid object}
    end

    def test_document_output
      assert_match /^<uddf version=\"#{Document::VERSION}\">.*<generator>.*<\/generator>.*<\/uddf>$/m, Document.new.to_uddf
    end

  end
end

