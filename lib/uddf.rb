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
      args.each { |key,value| add_node(key, value) } if args.is_a?(Hash)
    end

    def nodename
      self.class.to_s.split('::')[-1].downcase
    end

    def nodes
      node_array ||= Hash.new
      instance_variables.each { |iv| node_array[Base.convert_from_iv(iv)] = instance_variable_get(iv) }
      return node_array
    end

    def has_node?(var)
      nodes.has_key?(var.to_sym)
    end

    def add_nodes(args)
      args.each { |k,v| add_node(k,v) } if args.is_a?(Hash)
      args.each { |v|   add_node(v)   } if args.is_a?(Array)
      add_node(args)                    if args.is_a?(String)
    end

    def add_node(var, value = true)
      instance_variable_set(Base.convert_to_iv(var), value.to_s)
    end

    def delete_node(var)
      remove_instance_variable(Base.convert_to_iv(var))
    end
    alias_method :del_node, :delete_node

    def to_elem
      XML.to_elem(self)
    end

    def method_missing(method, *args, &block)
      return super unless nodes.is_a?(Hash)

      /^(?<meth>\w*)(?<oper>\W*)$/ =~ method
      meth_sym = Base.convert_to_iv(meth)

      if has_node?(meth)
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
      return true if has_node?(method.to_s.gsub(/\W*$/, ''))
      super
    end

    private

      def self.convert_to_iv(var)
        # Remove leading and trailing spaces, then convert remaining spaces to '_'
        "@#{var.to_s.downcase.gsub(/^\s+/, '').gsub(/\s+$/,'').gsub(/\s+/, '_')}".to_sym
      end

      def self.convert_from_iv(var)
        var.to_s.gsub(/^@/, '').to_sym
      end
  end
end

require 'uddf/versions'
require 'uddf/document'
require 'uddf/xml'
require 'uddf/diver'

