private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a request to cancel a Spot Instance.
  class CancelledSpotInstanceRequest
    # The ID of the Spot Instance request.
    property spot_instance_request_id : String | Nil

    # The state of the Spot Instance request.
    property state : CancelSpotInstanceRequestState | Nil

    def initialize(
      @spot_instance_request_id : String | Nil = nil,
      @state : CancelSpotInstanceRequestState | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @spot_instance_request_id
        params << {"#{prefix}SpotInstanceRequestId", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        spot_instance_request_id: Core::XMLValue.string(node.xpath_node("*[local-name()='spotInstanceRequestId']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::CancelSpotInstanceRequestState.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@spot_instance_request_id, @state)
  end
end
