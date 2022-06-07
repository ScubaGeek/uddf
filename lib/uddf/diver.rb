module UDDF
  # UDDF::Diver class
  class Diver < Base
    def initialize(*args)
      super
      set_required(:owner)
      set_node(:owner, Person.new)
    end
  end
end
