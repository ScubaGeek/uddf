require 'ox'

module UDDF
  module XML
    def self.new(doc)
      Ox::Document.new(:version => '1.0', encoding: 'UTF-8')
    end

    def self.version
      Document::VERSION
    end

  end
end
