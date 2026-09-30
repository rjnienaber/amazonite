private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an EC2 Fleet that was successfully deleted.
  class DeleteFleetSuccessItem
    # The current state of the EC2 Fleet.
    property current_fleet_state : FleetStateCode | Nil

    # The previous state of the EC2 Fleet.
    property previous_fleet_state : FleetStateCode | Nil

    # The ID of the EC2 Fleet.
    property fleet_id : String | Nil

    def initialize(
      @current_fleet_state : FleetStateCode | Nil = nil,
      @previous_fleet_state : FleetStateCode | Nil = nil,
      @fleet_id : String | Nil = nil,
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

      if value = @fleet_id
        params << {"#{prefix}FleetId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        current_fleet_state: (n = node.xpath_node("*[local-name()='currentFleetState']")) ? AEC::FleetStateCode.from_json_object_key?(n.content) : nil,
        previous_fleet_state: (n = node.xpath_node("*[local-name()='previousFleetState']")) ? AEC::FleetStateCode.from_json_object_key?(n.content) : nil,
        fleet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='fleetId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@current_fleet_state, @previous_fleet_state, @fleet_id)
  end
end
