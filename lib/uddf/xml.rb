require "ox"

module UDDF
  # UDDF::XML module
  module XML
    def self.new(_doc)
      Ox::Document.new(version: "1.0", encoding: "UTF-8")
    end

    def self.version
      Document::VERSION
    end

    def self.to_elem(klass)
      raise ArgumentError, "Class #{klass.class} Must respond to #nodename and #nodes" unless klass.respond_to?(:nodename, :nodes)
      raise ArgumentError, "Class #{klass.class}#nodename may not be nil" if klass.nodename.nil?

      raise "Class #{klass.class}#nodes does not return a hash" unless klass.nodes.is_a?(Hash)

      doc = Ox::Element.new(klass.nodename)

      klass.nodes.each do |node, value|
        doc << (Ox::Element.new(node) << value)
      end

      doc
    end
  end
end
