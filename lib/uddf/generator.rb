require 'time'

module UDDF
  class Generator < UDDF::Base
    def initialize
      add_nodes( name: 'UDDF Ruby Gem', type: 'RubyGem', version:  VERSION, datetime: Time.now.iso8601 )
    end
  end
end
