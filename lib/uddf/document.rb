require 'nokogiri'

module UDDF
  class Document
    def initialize(args = {})
      @xml = Nokogiri::XML::Document.parse(
          Nokogiri::XML::Builder.new(name: 'UDDF', encoding: args[:encoding] || 'UTF-8') do |xml|
            xml.uddf(version: UDDF::Document::VERSION)
          end.to_xml
      )
    end

    def version
      UDDF::Document::VERSION
    end

    def xml_version
      @xml.version
    end

    def method_missing(meth, *args, &block)
      if @xml.respond_to?(meth)
        @xml.send(meth, *args, &block)
      else
        super
      end
    end

  end

end
