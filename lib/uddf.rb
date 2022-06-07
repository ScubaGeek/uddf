# UDDF Module
module UDDF
  def self.version
    Document::VERSION
  end

  def self.new(*args)
    Document.new(*args)
  end

  # For inheritance
  class Base
    attr_reader :nodes, :required

    def initialize(*args)
      @nodes = {}
      @required = []

      args.each do |arg|
        if arg.is_a?(Hash) || arg.is_a?(Array)
          arg.each { |k, v| set_node(k, v) }
        else
          set_nodes(arg)
        end
      end
    end

    def nodename
      self.class.to_s.split("::")[-1].downcase
    end

    def node?(var)
      @nodes.has_key?(var.to_sym)
    end

    def add_nodes(args)
      args.each { |k, v| set_node(k, v) } if args.is_a?(Hash)
      args.each { |v| set_node(v) } if args.is_a?(Array)
      set_node(args) if args.is_a?(String)
    end
    alias set_nodes add_nodes

    def get_node(var)
      @nodes[Base.mkkey(var)] if node?(var)
    end

    def set_node(var, value = true, **opts)
      raise ArgumentError unless opts.is_a?(Hash)

      opts.merge(Base.node_defaults)

      set_required(var) if opts[:require]
      @nodes[Base.mkkey(var)] = value
    end
    alias add_node set_node

    def delete_node(var)
      raise StandardError, "#{var} is a required node, cannot delete" if required?(var)

      @nodes.delete Base.mkkey(var) if node?(var)
    end
    alias del_node delete_node

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

    def valid?
      return true if @required.empty?

      @required.each do |node|
        return false unless node?(node)
        return false if get_node(node).nil?
      end

      true
    end

    def method_missing(method, *args, &)
      return super unless @nodes.is_a?(Hash)

      /^(?<meth>\w*)(?<oper>\W*)$/ =~ method

      if node?(meth)
        case oper
        when ""  then get_node(meth)
        when "=" then set_node(meth, *args)
        else super
        end
      else
        super
      end
    end

    def respond_to_missing?(method, include_private = false)
      return super unless @nodes.is_a?(Hash)
      return true if node?(method.to_s.gsub(/\W*$/, ""))

      super
    end

    def self.mkkey(var)
      var.to_s.downcase.gsub(/^\s+/, "").gsub(/\s+$/, "").gsub(/\s+/, "_").to_sym
    end

    def self.node_defaults
      {
        require: false
      }
    end
  end
end

require "uddf/versions"
require "uddf/document"
require "uddf/xml"
require "uddf/diver"
require "uddf/classes"
