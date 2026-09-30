private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains information about a routing policy registration change, including the changes applied
  # and their publication state.
  class IpamRoutingPolicyRegistrationDelta
    # The unique identifier of the delta.
    property delta_id : String | Nil

    # The JSON specification describing the changes applied in this delta.
    property delta_json : String | Nil

    # The state of the delta. Valid values: `pending` | `published` | `failed`.
    property state : IpamRoutingPolicyRegistrationDeltaState | Nil

    # A message describing the current state, including error information if the delta failed.
    property state_message : String | Nil

    def initialize(
      @delta_id : String | Nil = nil,
      @delta_json : String | Nil = nil,
      @state : IpamRoutingPolicyRegistrationDeltaState | Nil = nil,
      @state_message : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @delta_id
        params << {"#{prefix}DeltaId", value}
      end

      if value = @delta_json
        params << {"#{prefix}DeltaJson", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @state_message
        params << {"#{prefix}StateMessage", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        delta_id: Core::XMLValue.string(node.xpath_node("*[local-name()='deltaId']")),
        delta_json: Core::XMLValue.string(node.xpath_node("*[local-name()='deltaJson']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::IpamRoutingPolicyRegistrationDeltaState.from_json_object_key?(n.content) : nil,
        state_message: Core::XMLValue.string(node.xpath_node("*[local-name()='stateMessage']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@delta_id, @delta_json, @state, @state_message)
  end
end
