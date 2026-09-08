private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the availability of capacity for a Capacity Reservation.
  class CapacityReservationStatus
    # The ID of the Capacity Reservation.
    property capacity_reservation_id : String | Nil

    # The combined amount of `Available` and `Unavailable` capacity in the Capacity Reservation.
    property total_capacity : Int32 | Nil

    # The remaining capacity. Indicates the amount of resources that can be launched into the Capacity
    # Reservation.
    property total_available_capacity : Int32 | Nil

    # The used capacity. Indicates that the capacity is in use by resources that are running in the
    # Capacity Reservation.
    property total_unavailable_capacity : Int32 | Nil

    def initialize(
      @capacity_reservation_id : String | Nil = nil,
      @total_capacity : Int32 | Nil = nil,
      @total_available_capacity : Int32 | Nil = nil,
      @total_unavailable_capacity : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_id
        params << {"#{prefix}CapacityReservationId", value}
      end

      if value = @total_capacity
        params << {"#{prefix}TotalCapacity", value.to_s}
      end

      if value = @total_available_capacity
        params << {"#{prefix}TotalAvailableCapacity", value.to_s}
      end

      if value = @total_unavailable_capacity
        params << {"#{prefix}TotalUnavailableCapacity", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationId']")),
        total_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalCapacity']")),
        total_available_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalAvailableCapacity']")),
        total_unavailable_capacity: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalUnavailableCapacity']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@capacity_reservation_id, @total_capacity, @total_available_capacity, @total_unavailable_capacity)
  end
end
