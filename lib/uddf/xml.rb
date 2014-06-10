require 'nokogiri'

module UDDF
  module XML
    def self.new
      Nokogiri::XML::Document.parse(
        Nokogiri::XML::Builder.new( encoding: 'UTF-8' ) do
          uddf(version: Document::VERSION) { yield }
        end.to_xml
      )
    end

    def self.version
      Document::VERSION
    end

    def self.null_fragment
      Nokogiri::XML::DocumentFragment.parse('')
    end

    def self.generate_fragment
      Nokogiri::XML::DocumentFragment.parse(
        Nokogiri::XML::Builder.with(self.null_fragment) { yield }
      )
    end

  end
end
