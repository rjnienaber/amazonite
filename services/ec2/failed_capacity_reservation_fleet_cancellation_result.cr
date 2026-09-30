private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Capacity Reservation Fleet that could not be cancelled.
  class FailedCapacityReservationFleetCancellationResult
    # The ID of the Capacity Reservation Fleet that could not be cancelled.
    property capacity_reservation_fleet_id : String | Nil

    # Information about the Capacity Reservation Fleet cancellation error.
    property cancel_capacity_reservation_fleet_error : CancelCapacityReservationFleetError | Nil

    def initialize(
      @capacity_reservation_fleet_id : String | Nil = nil,
      @cancel_capacity_reservation_fleet_error : CancelCapacityReservationFleetError | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @capacity_reservation_fleet_id
        params << {"#{prefix}CapacityReservationFleetId", value}
      end

      if value = @cancel_capacity_reservation_fleet_error
        params.concat(value.to_query_params("#{prefix}CancelCapacityReservationFleetError."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        capacity_reservation_fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationFleetId']")),
        cancel_capacity_reservation_fleet_error: node.xpath_node("*[local-name()='cancelCapacityReservationFleetError']").try { |n| CancelCapacityReservationFleetError.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @cancel_capacity_reservation_fleet_error
        value.validate!
      end
    end

    def_equals_and_hash(@capacity_reservation_fleet_id, @cancel_capacity_reservation_fleet_error)
  end
end
