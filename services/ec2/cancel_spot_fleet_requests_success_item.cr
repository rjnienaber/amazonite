private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Spot Fleet request that was successfully canceled.
  class CancelSpotFleetRequestsSuccessItem
    # The current state of the Spot Fleet request.
    property current_spot_fleet_request_state : BatchState | Nil

    # The previous state of the Spot Fleet request.
    property previous_spot_fleet_request_state : BatchState | Nil

    # The ID of the Spot Fleet request.
    property spot_fleet_request_id : String | Nil

    def initialize(
      @current_spot_fleet_request_state : BatchState | Nil = nil,
      @previous_spot_fleet_request_state : BatchState | Nil = nil,
      @spot_fleet_request_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @current_spot_fleet_request_state
        params << {"#{prefix}CurrentSpotFleetRequestState", value.to_json_object_key}
      end

      if value = @previous_spot_fleet_request_state
        params << {"#{prefix}PreviousSpotFleetRequestState", value.to_json_object_key}
      end

      if value = @spot_fleet_request_id
        params << {"#{prefix}SpotFleetRequestId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        current_spot_fleet_request_state: (n = node.xpath_node("*[local-name()='currentSpotFleetRequestState']")) ? AEC::BatchState.from_json_object_key?(n.content) : nil,
        previous_spot_fleet_request_state: (n = node.xpath_node("*[local-name()='previousSpotFleetRequestState']")) ? AEC::BatchState.from_json_object_key?(n.content) : nil,
        spot_fleet_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotFleetRequestId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@current_spot_fleet_request_state, @previous_spot_fleet_request_state, @spot_fleet_request_id)
  end
end
