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

  class TestGenerator < Minitest::Test
    def setup
      @gen = Generator.new( name: 'UDDF Ruby Gem', type: 'RubyGem', version:  VERSION, datetime: Time.now.iso8601 )
    end

    def test_datetime_is_iso8601_format
      # 2014-06-09T20:39:34-04:00"
      assert_match /\-\d{2}T\d+:/, @gen.nodes[:datetime], %q{UDDF::Generator doesn't return ISO8601 time format}
    end

    def test_generator_nodes
      assert_equal [ :name, :type, :version, :datetime ], @gen.nodes.keys
    end

    def test_to_elem
      assert_respond_to @gen, :to_elem, %q{UDDF::Generator#to_elem is not valid}
      assert_instance_of Ox::Element, @gen.to_elem
    end
  end

end

