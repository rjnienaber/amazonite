private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the price for a Reserved Instance.
  class PriceScheduleSpecification
    # The number of months remaining in the reservation. For example, 2 is the second to the last
    # month before the capacity reservation expires.
    property term : Int64 | Nil

    # The fixed price for the term.
    property price : Float64 | Nil

    # The currency for transacting the Reserved Instance resale. At this time, the only supported
    # currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    def initialize(
      @term : Int64 | Nil = nil,
      @price : Float64 | Nil = nil,
      @currency_code : CurrencyCodeValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @term
        params << {"#{prefix}Term", value.to_s}
      end

      if value = @price
        params << {"#{prefix}Price", value.to_s}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        term: Core::XMLValue.i64(node.xpath_node("*[local-name()='term']")),
        price: Core::XMLValue.f64(node.xpath_node("*[local-name()='price']")),
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@term, @price, @currency_code)
  end
end
