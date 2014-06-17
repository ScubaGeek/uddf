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

  def test_nodes
    assert_respond_to @t, :nodes
    assert_instance_of Hash, @t.nodes
    assert_equal @t.nodes, { :foo => 'bar' }
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

