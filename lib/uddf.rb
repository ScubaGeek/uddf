require 'uddf/versions'
require 'uddf/document'
require 'uddf/generator'
require 'uddf/diver'
require 'uddf/xml'

module UDDF
  def self.version
    Document::VERSION
  end

  def self.new(*args)
    Document.new(*args)
  end

end
