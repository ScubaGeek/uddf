require_relative '../test_helper'

class TestHash < Minitest::Unit::TestCase

  def test_to_uddf_method
    my_hash = Hash.new
    assert_respond_to my_hash, :to_uddf, 'Hash does not have a .to_uddf method'
  end

end
