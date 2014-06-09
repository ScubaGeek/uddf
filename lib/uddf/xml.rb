module UDDF
  module XML
    def to_uddf
      return UDDF::Document.to_xml
    end
  end
end
