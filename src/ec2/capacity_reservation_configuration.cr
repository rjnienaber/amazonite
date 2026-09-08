private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the configuration of a Capacity Reservation.
  class CapacityReservationConfiguration
    # The number of instances in the Capacity Reservation.
    property instance_count : Int32 | Nil

    # The current state of the Capacity Reservation.
    property reservation_state : String | Nil

    def initialize(
      @instance_count : Int32 | Nil = nil,
      @reservation_state : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @instance_count
        params << {"#{prefix}InstanceCount", value.to_s}
      end

      if value = @reservation_state
        params << {"#{prefix}ReservationState", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        instance_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='instanceCount']")),
        reservation_state: Core::XMLValue.string(node.xpath_node("*[local-name()='reservationState']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@instance_count, @reservation_state)
  end
end
