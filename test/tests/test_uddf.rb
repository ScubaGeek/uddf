require_relative '../test_helper'

class TestUDDF < Minitest::Test

  def test_uddf_document
    assert_instance_of UDDF::Document, UDDF.new, %q{UDDF::Document.new does not produce a valid object}
  end

  def test_uddf_output
    doc = UDDF.new
    assert_respond_to doc, :to_uddf, %q{UDDF::Document doesn't respond to 'to_uddf'}
    assert_instance_of String, UDDF.new.to_xml, %q{UDDF#to_xml doesn't produce valid output}
  end

end

class TestBase < Minitest::Test
  def setup
    @t = UDDF::Base.new(foo: 'bar')
  end

  def test_convert_to_iv_class_method
    assert_equal '@foobar'.to_sym, UDDF::Base.convert_to_iv('foobar')
  end

  def test_convert_from_iv_class_method
    assert_equal :foobar, UDDF::Base.convert_from_iv('@foobar'.to_sym).to_sym
  end

  def test_nodes
    assert_respond_to @t, :nodes
    assert_instance_of Hash, @t.nodes
    assert_equal @t.nodes, { :foo => 'bar' }
  end

  def test_add_nodes_with_hash
    @t.add_nodes({beep: 'one', bop: 'two'})

    assert_respond_to @t, :beep
    assert_equal 'one', @t.beep, %q{beep should be 'one'}
    assert_respond_to @t, :bop
    assert_equal 'two', @t.bop, %q{bop should be 'two'}
  end

  def test_add_nodes_with_array
    @t.add_nodes(%w(uno dos))

    assert_respond_to @t, :uno
    assert @t.uno, %q{uno should be 'true'}
    assert_respond_to @t, :dos
    assert @t.dos, %q{dos should be 'true'}
  end

  def test_add_nodes_with_string
    @t.add_nodes('string test')

    assert_respond_to @t, :string_test
    assert @t.string_test, %q{string_test should be 'true'}
  end

  def test_add_node
    # Validate the node no longer exists
    refute @t.nodes.has_key?(:test), %q{whoops, node 'boo' already exists, test control failure}

    @t.add_node(:boo, 'baz')

    assert @t.nodes.has_key?(:boo), %q{#add_node does not add node}
    assert_equal 'baz', @t.boo
  end

  def test_add_node_with_space
    @t.add_node('Space Test')
    assert @t.nodes.has_key?(:space_test)
  end

  def test_delete_node
    # Validate the node does exist
    assert @t.nodes.has_key?(:foo), %q{whoops, node 'foo' already doesn't exist, test control failure}

    @t.delete_node(:foo)

    # Validate the node no longer exists
    refute @t.nodes.has_key?(:foo), %q{#delete_node does not delete node}
    refute_respond_to @t, :foo
  end

  def test_add_node_defaults
    @t.add_node('should_be_true')
    assert @t.nodes.has_key?(:should_be_true), %q{#add_node does not add node}
    assert @t.should_be_true, %q{#add_node doesn't default to 'true'}
  end

  def test_has_node?
    assert_respond_to @t, :has_node?
    assert @t.has_node?(:foo)
    refute @t.has_node?(:bar)
  end

  def test_nodename
    assert_respond_to @t, :nodename
    assert_equal 'base', @t.nodename
  end

  def test_instance_variables
    assert_equal [:@foo], @t.instance_variables
    assert_equal 'bar', @t.instance_variable_get(:@foo)
  end

  def test_instance_variable_getter
    assert_respond_to @t, :foo
    assert_equal 'bar', @t.foo
  end

  def test_instance_variable_setter
    assert_respond_to @t, :foo=
    @t.foo = 'Baz'
    assert_equal 'Baz', @t.foo
  end

  def test_invalid_method
    assert_raises NoMethodError do
      @t.baz
    end
  end
end

