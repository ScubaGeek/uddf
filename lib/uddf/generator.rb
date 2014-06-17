require 'time'

module UDDF
  class Generator < UDDF::Base
    def initialize
      @name = 'UDDF Ruby Gem'
      @type = 'RubyGem'
      @version = VERSION
      @datetime = Time.now.iso8601
    end
  end
end
