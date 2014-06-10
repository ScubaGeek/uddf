module UDDF
  class Document
    def initialize(args = {})
      @generator = Generator.new
    end
    attr_reader :generator

    def xmldata
      Nokogiri::XML::Document.parse(
        Nokogiri::XML::Builder.new( encoding: 'UTF-8' ) do |xml|
          xml.uddf(version: Document::VERSION) {
            xml.generator {
              xml.name     generator.name
              xml.type     generator.type
              xml.version  generator.version
              xml.datetime generator.datetime
            }
          }
        end.to_xml
      )
    end

    def to_uddf
      xmldata.to_xml
    end
    alias_method :to_xml, :to_uddf

  end
end

