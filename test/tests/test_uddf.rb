require_relative "../test_helper"

class TestUDDF < Minitest::Test
  def test_uddf_document
    assert_instance_of UDDF::Document, UDDF.new, "UDDF::Document.new does not produce a valid object"
  end

  def test_uddf_output
    doc = UDDF.new
    assert_respond_to doc, :to_uddf, "UDDF::Document doesn't respond to 'to_uddf'"
    assert_instance_of String, UDDF.new.to_xml, "UDDF#to_xml doesn't produce valid output"
  end
end

class TestBase < Minitest::Test
  def setup
    @t = UDDF::Base.new(foo: "bar")
  end

  def test_mkkey_class_method
    assert_equal :foo_bar_baz, UDDF::Base.mkkey("   foo Bar  BAZ ")
  end

  def test_nodes
    assert_respond_to @t, :nodes
    assert_instance_of Hash, @t.nodes
    assert_equal @t.nodes, { foo: "bar" }
  end

  def test_add_nodes_with_hash
    @t.add_nodes({ beep: "one", bop: "two" })

    assert_respond_to @t, :beep
    assert_equal "one", @t.beep, "beep should be 'one'"
    assert_respond_to @t, :bop
    assert_equal "two", @t.bop, "bop should be 'two'"
  end

  def test_add_nodes_with_array
    @t.add_nodes(%w[uno dos])

    assert_respond_to @t, :uno
    assert @t.uno, "uno should be 'true'"
    assert_respond_to @t, :dos
    assert @t.dos, "dos should be 'true'"
  end

  def test_add_nodes_with_string
    @t.add_nodes("string test")

    assert_respond_to @t, :string_test
    assert @t.string_test, "string_test should be 'true'"
  end

  def test_add_node
    # Validate the node no longer exists
    refute @t.nodes.has_key?(:boo), "whoops, node 'boo' already exists, test control failure"

    @t.add_node(:boo, "baz")

    assert @t.nodes.has_key?(:boo), "#add_node does not add node"
    assert_equal "baz", @t.boo
  end

  def test_add_node_with_invalid_opts
    assert_raises ArgumentError do
      @t.add_node(:baz, nil, nil)
    end
  end

  def test_required_node
    @t.set_node(:test, "required", require: true)
    assert @t.required?(:test), "#required? should return true"
  end

  def test_set_required_array
    @t.set_required(:one, :two)
    assert @t.required?(:one), "one should be required"
    assert @t.required?(:two), "two should be required"
  end

  def test_retrieve_required_array
    my_array = %i[foo bar baz]
    @t.set_required my_array, :bar
    assert_equal my_array, @t.required
  end

  def test_error_on_delete_required
    @t.set_node(:required, "required", require: true)
    assert_raises StandardError do
      @t.delete_node(:required)
    end
  end

  def test_set_required_method
    refute @t.required?(:must_have), "whoope, must_have is already required, test control failure"
    @t.set_required(:must_have)
    assert @t.required?(:must_have), "must_have should be required"
  end

  def test_not_required_method
    @t.add_node(:not_required, nil, require: true)
    assert @t.required?(:not_required), "not_required should be required"
    @t.not_required(:not_required)
    refute @t.required?(:not_required), "not_required should no longer be required"
  end

  def test_add_node_with_space
    @t.add_node("Space Test")
    assert @t.nodes.has_key?(:space_test)
  end

  def test_delete_node
    # Validate the node does exist
    assert @t.nodes.has_key?(:foo), "whoops, node 'foo' already doesn't exist, test control failure"

    @t.delete_node(:foo)

    # Validate the node no longer exists
    refute @t.nodes.has_key?(:foo), "#delete_node does not delete node"
    refute_respond_to @t, :foo
  end

  def test_add_node_defaults
    @t.add_node("should_be_true")
    assert @t.nodes.has_key?(:should_be_true), "#add_node does not add node"
    assert @t.should_be_true, "#add_node doesn't default to 'true'"
  end

  def test_node?
    assert_respond_to @t, :node?
    assert @t.node?(:foo)
    refute @t.node?(:bar)
  end

  def test_nodename
    assert_respond_to @t, :nodename
    assert_equal "base", @t.nodename
  end

  def test_instance_variable_getter
    assert_respond_to @t, :foo
    assert_equal "bar", @t.foo
  end

  def test_instance_variable_setter
    assert_respond_to @t, :foo=
    @t.foo = "Baz"
    assert_equal "Baz", @t.foo
  end

  def test_invalid_method
    assert_raises NoMethodError do
      @t.baz
    end
  end

  def test_no_method_error_on_missing_node
    assert_raises NoMethodError do
      @t.bar
    end
  end

  def test_not_valid_when_required_nil
    @t.foo = nil
    assert @t.valid?, "Instance should be valid"

    @t.set_required(:foo)
    refute @t.valid?, "Instance should not be valid"
  end

  def test_not_valid_when_required_missing
    assert @t.valid?, "Instance should be valid"

    @t.set_required(:baz)
    refute @t.valid?, "Instance should not be valid"
  end
end
