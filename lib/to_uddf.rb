require "to_uddf/version"

class Hash
  include UDDF
end

module UDDF
  def to_uddf
    puts "Hey!  We're in to_uddf"
  end
end
