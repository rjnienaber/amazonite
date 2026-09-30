private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the limit price of a Reserved Instance offering.
  class ReservedInstanceLimitPrice
    # Used for Reserved Instance Marketplace offerings. Specifies the limit price on the total order
    # (instanceCount * price).
    property amount : Float64 | Nil

    # The currency in which the `limitPrice` amount is specified. At this time, the only supported
    # currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    def initialize(
      @amount : Float64 | Nil = nil,
      @currency_code : CurrencyCodeValues | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @amount
        params << {"#{prefix}Amount", value.to_s}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amount: Core::XMLValue.f64(node.xpath_node("*[local-name()='amount']")),
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@amount, @currency_code)
  end
end
