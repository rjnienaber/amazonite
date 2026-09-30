private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the price for a Reserved Instance.
  class PriceSchedule
    # The current price schedule, as determined by the term remaining for the Reserved Instance in the
    # listing.
    #
    # A specific price schedule is always in effect, but only one price schedule can be active at any
    # time. Take, for example, a Reserved Instance listing that has five months remaining in its term.
    # When you specify price schedules for five months and two months, this means that schedule 1,
    # covering the first three months of the remaining term, will be active during months 5, 4, and 3.
    # Then schedule 2, covering the last two months of the term, will be active for months 2 and 1.
    property active : Bool | Nil

    # The currency for transacting the Reserved Instance resale. At this time, the only supported
    # currency is `USD`.
    property currency_code : CurrencyCodeValues | Nil

    # The fixed price for the term.
    property price : Float64 | Nil

    # The number of months remaining in the reservation. For example, 2 is the second to the last
    # month before the capacity reservation expires.
    property term : Int64 | Nil

    def initialize(
      @active : Bool | Nil = nil,
      @currency_code : CurrencyCodeValues | Nil = nil,
      @price : Float64 | Nil = nil,
      @term : Int64 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @active
        params << {"#{prefix}Active", Core::QueryValue.bool(value)}
      end

      if value = @currency_code
        params << {"#{prefix}CurrencyCode", value.to_json_object_key}
      end

      if value = @price
        params << {"#{prefix}Price", value.to_s}
      end

      if value = @term
        params << {"#{prefix}Term", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        active: Core::XMLValue.bool(node.xpath_node("*[local-name()='active']")),
        currency_code: (n = node.xpath_node("*[local-name()='currencyCode']")) ? AEC::CurrencyCodeValues.from_json_object_key?(n.content) : nil,
        price: Core::XMLValue.f64(node.xpath_node("*[local-name()='price']")),
        term: Core::XMLValue.i64(node.xpath_node("*[local-name()='term']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@active, @currency_code, @price, @term)
  end
end
