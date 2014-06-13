module UDDF
  class Document
    def initialize(args = {})
      @doc = Ox::Document.new(:version => '1.0', encoding: 'UTF-8')
      @generator = Generator.new
    end
    attr_reader :generator

    def to_uddf
      top = Ox::Element.new(:uddf)
      top[:version] = VERSION
      top << @generator.to_elem
      @doc << top
      Ox.dump(@doc)
    end
    alias_method :to_xml, :to_uddf
  end
end

