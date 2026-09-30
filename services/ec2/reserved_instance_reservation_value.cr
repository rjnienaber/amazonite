private alias Core = Amazonite::Core

module Amazonite::EC2
  # The total value of the Convertible Reserved Instance.
  class ReservedInstanceReservationValue
    # The total value of the Convertible Reserved Instance that you are exchanging.
    property reservation_value : ReservationValue | Nil

    # The ID of the Convertible Reserved Instance that you are exchanging.
    property reserved_instance_id : String | Nil

    def initialize(
      @reservation_value : ReservationValue | Nil = nil,
      @reserved_instance_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @reservation_value
        params.concat(value.to_query_params("#{prefix}ReservationValue."))
      end

      if value = @reserved_instance_id
        params << {"#{prefix}ReservedInstanceId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        reservation_value: node.xpath_node("*[local-name()='reservationValue']").try { |n| ReservationValue.from_xml(n) },
        reserved_instance_id: Core::XMLValue.string(node.xpath_node("*[local-name()='reservedInstanceId']")),
      )
    end

    def validate! : Nil
      if value = @reservation_value
        value.validate!
      end
    end

    def_equals_and_hash(@reservation_value, @reserved_instance_id)
  end
end
