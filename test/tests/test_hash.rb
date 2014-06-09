require_relative '../test_helper'

class TestHash < Minitest::Test
  def setup
    @test_hash = Hash.new()
  end

  def test_test_data
    assert_instance_of Hash, @test_hash, '@test_hash is not a Hash'
  end

  def test_hash_has_to_uddf_method
    assert_respond_to @test_hash, :to_uddf, 'Hash does not have a .to_uddf method'
  end

  def test_hash_to_uddf_returns_xml_data
    assert_instance_of Nokogiri::XML::Document, Hash.new.to_uddf, 'to_uddf does not return XML object'
  end

end
