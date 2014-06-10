require 'nokogiri'

module UDDF
  module XML
    def self.version
      Document::VERSION
    end

    def self.null_fragment
      Nokogiri::XML::DocumentFragment.parse('')
    end

    def self.generate_fragment(&block)
      Nokogiri::XML::DocumentFragment.parse(
          Nokogiri::XML::Builder.with(self.null_fragment) &block
      )
    end

  end
end
