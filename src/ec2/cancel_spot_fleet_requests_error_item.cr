private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a Spot Fleet request that was not successfully canceled.
  class CancelSpotFleetRequestsErrorItem
    # The error.
    property error : CancelSpotFleetRequestsError | Nil

    # The ID of the Spot Fleet request.
    property spot_fleet_request_id : String | Nil

    def initialize(
      @error : CancelSpotFleetRequestsError | Nil = nil,
      @spot_fleet_request_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @error
        params.concat(value.to_query_params("#{prefix}Error."))
      end

      if value = @spot_fleet_request_id
        params << {"#{prefix}SpotFleetRequestId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        error: node.xpath_node("*[local-name()='error']").try { |n| CancelSpotFleetRequestsError.from_xml(n) },
        spot_fleet_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotFleetRequestId']")),
      )
    end

    def validate! : Nil
      if value = @error
        value.validate!
      end
    end

    def_equals_and_hash(@error, @spot_fleet_request_id)
  end
end
