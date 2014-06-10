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

  end
end
