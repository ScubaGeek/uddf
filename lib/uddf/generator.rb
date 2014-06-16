require 'time'

module UDDF
  class Generator
    def initialize
      @nodename = 'generator'
      @name = 'UDDF Ruby Gem'
      @type = 'RubyGem'
      @version = VERSION
      @datetime = Time.now.iso8601
    end
    attr_reader :nodename

    def nodes
      {
          name:     @name,
          type:     @type,
          version:  @version,
          datetime: @datetime
      }
    end

    def to_elem
      XML.to_elem(self)
    end

  end
end
