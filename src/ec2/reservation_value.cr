private alias Core = Amazonite::Core

module Amazonite::EC2
  # The cost associated with the Reserved Instance.
  class ReservationValue
    # The hourly rate of the reservation.
    property hourly_price : String | Nil

    # The balance of the total value (the sum of remainingUpfrontValue + hourlyPrice * number of hours
    # remaining).
    property remaining_total_value : String | Nil

    # The remaining upfront cost of the reservation.
    property remaining_upfront_value : String | Nil

    def initialize(
      @hourly_price : String | Nil = nil,
      @remaining_total_value : String | Nil = nil,
      @remaining_upfront_value : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @hourly_price
        params << {"#{prefix}HourlyPrice", value}
      end

      if value = @remaining_total_value
        params << {"#{prefix}RemainingTotalValue", value}
      end

      if value = @remaining_upfront_value
        params << {"#{prefix}RemainingUpfrontValue", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        hourly_price: Core::XMLValue.string(node.xpath_node("*[local-name()='hourlyPrice']")),
        remaining_total_value: Core::XMLValue.string(node.xpath_node("*[local-name()='remainingTotalValue']")),
        remaining_upfront_value: Core::XMLValue.string(node.xpath_node("*[local-name()='remainingUpfrontValue']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@hourly_price, @remaining_total_value, @remaining_upfront_value)
  end
end
