module UDDF
  # Generator class
  class Generator < UDDF::Base
    def initialize(*args)
      super
      set_required(:name, :type, :version, :datetime)
    end
  end

  # Document class
  class Document
    attr_reader :doc, :root

    def initialize(_args = {})
      @root = Ox::Element.new(:uddf)
      @root[:version] = VERSION
      @root << Generator.new(name: "UDDF Ruby Gem", type: "RubyGem", version: VERSION, datetime: Time.now.iso8601).to_elem
      @doc = Ox::Document.new(version: "1.0", encoding: "UTF-8") << @root
    end

    def to_uddf
      Ox.dump(@root)
    end

    def to_xml
      Ox.dump(@doc, with_xml: true)
    end

    def to_s
      Ox.dump(doc)
    end
  end
end
