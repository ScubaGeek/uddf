require 'uddf/versions'
require 'uddf/generator'
require 'uddf/xml'

module UDDF
  def self.version
    UDDF::Document::VERSION
  end
end
