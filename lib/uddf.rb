module UDDF
  def self.version
    Document::VERSION
  end

  def self.new(*args)
    Document.new(*args)
  end

  # For inheritance
  class Base
    def nodename
      self.class.to_s.split('::')[-1].downcase
    end

    def nodes
      node_arr = Hash.new
      self.instance_variables.each do |var|
          node_arr[var.to_s.gsub(/^@/, '').to_sym] = self.instance_variable_get(var)
      end
      return node_arr
    end

    def to_elem
      XML.to_elem(self)
    end
  end
end

require 'uddf/versions'
require 'uddf/document'
require 'uddf/xml'
require 'uddf/generator'
require 'uddf/diver'

