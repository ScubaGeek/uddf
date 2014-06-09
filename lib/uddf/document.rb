require 'nokogiri'

module UDDF
  class Document
    def initialize(args = {})
      @document
    end
    attr_reader :document

    def self.to_xml
      Nokogiri::XML::Document.new
    end
  end

  module XML
    def to_uddf
      return UDDF::Document.to_xml
    end
  end
end

