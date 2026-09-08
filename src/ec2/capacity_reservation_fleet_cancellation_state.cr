private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Capacity Reservation Fleet that was successfully cancelled.
  class CapacityReservationFleetCancellationState
    # The current state of the Capacity Reservation Fleet.
    property current_fleet_state : CapacityReservationFleetState | Nil

    # The previous state of the Capacity Reservation Fleet.
    property previous_fleet_state : CapacityReservationFleetState | Nil

    # The ID of the Capacity Reservation Fleet that was successfully cancelled.
    property capacity_reservation_fleet_id : String | Nil

    def initialize(
      @current_fleet_state : CapacityReservationFleetState | Nil = nil,
      @previous_fleet_state : CapacityReservationFleetState | Nil = nil,
      @capacity_reservation_fleet_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @current_fleet_state
        params << {"#{prefix}CurrentFleetState", value.to_json_object_key}
      end

      if value = @previous_fleet_state
        params << {"#{prefix}PreviousFleetState", value.to_json_object_key}
      end

      if value = @capacity_reservation_fleet_id
        params << {"#{prefix}CapacityReservationFleetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        current_fleet_state: (n = node.xpath_node("*[local-name()='currentFleetState']")) ? AEC::CapacityReservationFleetState.from_json_object_key?(n.content) : nil,
        previous_fleet_state: (n = node.xpath_node("*[local-name()='previousFleetState']")) ? AEC::CapacityReservationFleetState.from_json_object_key?(n.content) : nil,
        capacity_reservation_fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='capacityReservationFleetId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@current_fleet_state, @previous_fleet_state, @capacity_reservation_fleet_id)
  end
end
