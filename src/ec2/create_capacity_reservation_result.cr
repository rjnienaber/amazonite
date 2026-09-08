private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateCapacityReservationResult
    # Information about the Capacity Reservation.
    property capacity_reservation : CapacityReservation | Nil

    def initialize(
      @capacity_reservation : CapacityReservation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation
        params.concat(value.to_query_params("#{prefix}CapacityReservation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation: node.xpath_node("*[local-name()='capacityReservation']").try { |n| CapacityReservation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @capacity_reservation
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation)
  end
end
