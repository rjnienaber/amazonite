private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Reserved Instance offering.
  class PricingDetail
    # The number of reservations available for the price.
    property count : Int32 | Nil

    # The price per instance.
    property price : Float64 | Nil

    def initialize(
      @count : Int32 | Nil = nil,
      @price : Float64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @count
        params << {"#{prefix}Count", value.to_s}
      end

      if value = @price
        params << {"#{prefix}Price", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        count: Core::XMLValue.i32(node.xpath_node("*[local-name()='count']")),
        price: Core::XMLValue.f64(node.xpath_node("*[local-name()='price']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@count, @price)
  end
end
