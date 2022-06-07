require_relative "../test_helper"

module UDDF
  class TestDiver < Minitest::Test
    def setup
      @diver = UDDF::Diver.new(firstname: "Test", lastname: "User")
      refute @diver.nil?, "UDDF::Diver is not a valid object"
    end

    def test_structure
      assert_instance_of UDDF::Diver, @diver, "UDDF::Diver does not return a Diver object"
      assert_respond_to @diver, :to_elem, "UDDF::Diver does not respond to #to_elem"
    end

    def test_get_name
      assert_equal "Test", @diver.firstname
      assert_equal "User", @diver.lastname
    end

    def test_set_name
      @diver.firstname = "Bob"
      assert_equal "Bob", @diver.firstname
    end

    def test_validity
      assert @diver.valid?, "UDDF::Diver is not valid"
    end
  end
end
