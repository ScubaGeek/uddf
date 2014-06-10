module UDDF
  class Document
    def initialize(args = {})
      @generator = Generator.new
    end
    attr_reader :generator

    def to_uddf
      XML.new(self).to_xml
    end
    alias_method :to_xml, :to_uddf

  end
end

