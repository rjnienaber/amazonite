private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of RequestSpotFleet.
  class RequestSpotFleetResponse
    # The ID of the Spot Fleet request.
    property spot_fleet_request_id : String | Nil

    def initialize(
      @spot_fleet_request_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @spot_fleet_request_id
        params << {"#{prefix}SpotFleetRequestId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        spot_fleet_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotFleetRequestId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@spot_fleet_request_id)
  end
end
