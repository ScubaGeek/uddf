module UDDF
  def self.version
    Document::VERSION
  end

  def self.new(*args)
    Document.new(*args)
  end

  # For inheritance
  class Base
    def initialize(args = {})
      if args.is_a?(Hash)
        args.each do |key,value|
          instance_variable_set("@#{key.to_s}", value.to_s)
        end
      end
    end

    def nodename
      self.class.to_s.split('::')[-1].downcase
    end

    def nodes
      node_arr = Hash.new
      instance_variables.each do |var|
        node_arr[var.to_s.gsub(/^@/, '').to_sym] = instance_variable_get(var)
      end
      return node_arr
    end

    def to_elem
      XML.to_elem(self)
    end

    def method_missing(method, *args, &block)
      return super unless nodes.is_a?(Hash)

      /^(?<meth>\w*)(?<oper>\W*)$/ =~ method
      meth_sym = "@#{meth}".to_sym

      if nodes.has_key?(meth.to_sym)
        case oper
          when ''  then instance_variable_get(meth_sym)
          when '=' then instance_variable_set(meth_sym, *args)
          else super
        end
      else
        super
      end
    end

    def respond_to?(method, include_private = false)
      return super unless nodes.is_a?(Hash)
      return true if nodes.has_key?(method.to_s.gsub(/\W*$/, '').to_sym)
      super
    end

  end
end

require 'uddf/versions'
require 'uddf/document'
require 'uddf/xml'
require 'uddf/generator'
require 'uddf/diver'

