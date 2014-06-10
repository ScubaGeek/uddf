require 'uddf/versions'
require 'uddf/generator'
require 'uddf/document'
require 'uddf/xml'

module UDDF
  def self.version
    Document::VERSION
  end

  def self.new(*args)
    Document.new(*args)
  end

end
