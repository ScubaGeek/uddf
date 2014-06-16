require 'ox'

module UDDF
  module XML
    def self.new(doc)
      Ox::Document.new(:version => '1.0', encoding: 'UTF-8')
    end

    def self.version
      Document::VERSION
    end


    def self.to_elem(klass, nodes)
      doc = Ox::Element.new(klass.class.name.split('::')[-1].downcase)
      nodes.each do |node|
        raise ArgumentError, "#{klass.class} does not respond to #{node}" unless klass.respond_to?(node)
        doc << ( Ox::Element.new(node) << klass.send(node) )
      end
      return doc
    end
  end
end
