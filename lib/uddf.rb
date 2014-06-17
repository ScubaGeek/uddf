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
      @nodes = {}
      @required = []

      args.each { |key,value| set_node(key, value) } if args.is_a?(Hash)
    end
    attr_reader :nodes, :required

    def nodename
      self.class.to_s.split('::')[-1].downcase
    end

    def has_node?(var)
      @nodes.has_key?(var.to_sym)
    end

    def add_nodes(args)
      args.each { |k,v| set_node(k,v) } if args.is_a?(Hash)
      args.each { |v|   set_node(v)   } if args.is_a?(Array)
      set_node(args)                    if args.is_a?(String)
    end
    alias_method :set_nodes, :add_nodes

    def get_node(var)
      @nodes[Base.mkkey(var)] if has_node?(var)
    end

    def set_node(var, value = true, require = false)
      set_required(var) if require
      @nodes[Base.mkkey(var)] = value
    end
    alias_method :add_node, :set_node

    def delete_node(var)
      raise StandardError, "#{var.to_s} is a required node, cannot delete" if required?(var)
      @nodes.delete Base.mkkey(var) if has_node?(var)
    end
    alias_method :del_node, :delete_node

    def set_required(*vars)
      vars.flatten.each do |var|
        @required << Base.mkkey(var) unless required?(var)
      end
    end

    def not_required(var)
      @required.delete Base.mkkey(var) if required?(var)
    end

    def required?(var)
      @required.include? Base.mkkey(var)
    end

    def to_elem
      XML.to_elem(self)
    end

    def method_missing(method, *args, &block)
      return super unless @nodes.is_a?(Hash)

      /^(?<meth>\w*)(?<oper>\W*)$/ =~ method

      if has_node?(meth)
        case oper
          when ''  then get_node(meth)
          when '=' then set_node(meth, *args)
          else super
        end
      else
        super
      end
    end

    def respond_to?(method, include_private = false)
      return super unless @nodes.is_a?(Hash)
      return true if has_node?(method.to_s.gsub(/\W*$/, ''))
      super
    end

    private

      def self.mkkey(var)
        var.to_s.downcase.gsub(/^\s+/,'').gsub(/\s+$/,'').gsub(/\s+/, '_').to_sym
      end

  end
end

require 'uddf/versions'
require 'uddf/document'
require 'uddf/xml'
require 'uddf/diver'

