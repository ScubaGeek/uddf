module UDDF
  class Generator < UDDF::Base; end

  class Document
    def initialize(args = {})
      @root = Ox::Element.new(:uddf)
      @root[:version] = VERSION
      @root << Generator.new( name: 'UDDF Ruby Gem', type: 'RubyGem', version:  VERSION, datetime: Time.now.iso8601 ).to_elem
      @doc = Ox::Document.new(:version => '1.0', encoding: 'UTF-8') << @root
    end
    attr_reader :doc, :root

    def to_uddf
      Ox.dump(@root)
    end

    def to_xml
      Ox.dump(@doc, with_xml: true)
    end

    def to_s
      Ox.dump(self.doc)
    end
  end
end

