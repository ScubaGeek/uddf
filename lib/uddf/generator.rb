require 'time'

module UDDF
  class Generator
    def initialize
      @name = 'UDDF Ruby Gem'
      @type = 'RubyGem'
      @version = UDDF.version
      @datetime = Time.now.iso8601
    end
    attr_reader :name, :type, :version, :datetime

    def to_xml
      XML.generate_fragment do
        generator {
          name     { self.name }
          type     { self.type }
          version  { self.version }
          datetime { self.datetime }
        }
      end
    end
  end
end
