require 'time'

module UDDF
  class Generator
    def initialize
      @name = 'UDDF Ruby Gem'
      @type = 'RubyGem'
      @version = VERSION
      @datetime = Time.now.iso8601
    end
    attr_reader :name, :type, :version, :datetime

    def to_elem
      doc = Ox::Element.new('generator')
      [:name, :type, :version, :datetime].each do |key|
        elem = Ox::Element.new(key)
        elem << self.send(key)
        doc << elem
      end
      doc
    end
  end
end
