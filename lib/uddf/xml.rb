require 'nokogiri'

module UDDF
  module XML
    def self.new(doc)
      Nokogiri::XML::Document.parse(
          Nokogiri::XML::Builder.new( encoding: 'UTF-8' ) do |xml|
            xml.uddf(version: self.version) {
              xml.generator {
                xml.name     doc.generator.name
                xml.type     doc.generator.type
                xml.version  doc.generator.version
                xml.datetime doc.generator.datetime
              }
            }
          end.to_xml
      )
    end

    def self.version
      Document::VERSION
    end

  end
end
