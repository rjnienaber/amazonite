private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes dynamic routing for the transit gateway peering attachment.
  class TransitGatewayPeeringAttachmentOptions
    # Describes whether dynamic routing is enabled or disabled for the transit gateway peering
    # attachment.
    property dynamic_routing : DynamicRoutingValue | Nil

    # Indicates whether the requester allows multipath resilience for the transit gateway peering
    # attachment.
    property requester_allow_multipath_resilience : Bool | Nil

    # The multipath resilience mode for the requester. This value is present only when the requester
    # allows multipath resilience.
    property requester_multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil

    # Indicates whether the accepter allows multipath resilience for the transit gateway peering
    # attachment.
    property accepter_allow_multipath_resilience : Bool | Nil

    # The multipath resilience mode for the accepter. This value is present only when the accepter
    # allows multipath resilience.
    property accepter_multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil

    # The multipath resilience status of the transit gateway peering attachment. The possible values
    # are:
    #
    # - `enabled` – Both the requester and the accepter allow multipath resilience.
    #
    # - `pending` – Either the requester or the accepter allows multipath resilience, but not both.
    #
    # - `disabled` – Neither the requester nor the accepter allows multipath resilience.
    property multipath_resilience_status : TransitGatewayPeeringAttachmentMultipathResilienceStatus | Nil

    def initialize(
      @dynamic_routing : DynamicRoutingValue | Nil = nil,
      @requester_allow_multipath_resilience : Bool | Nil = nil,
      @requester_multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil = nil,
      @accepter_allow_multipath_resilience : Bool | Nil = nil,
      @accepter_multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil = nil,
      @multipath_resilience_status : TransitGatewayPeeringAttachmentMultipathResilienceStatus | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dynamic_routing
        params << {"#{prefix}DynamicRouting", value.to_json_object_key}
      end

      if value = @requester_allow_multipath_resilience
        params << {"#{prefix}RequesterAllowMultipathResilience", Core::QueryValue.bool(value)}
      end

      if value = @requester_multipath_resilience_mode
        params << {"#{prefix}RequesterMultipathResilienceMode", value.to_json_object_key}
      end

      if value = @accepter_allow_multipath_resilience
        params << {"#{prefix}AccepterAllowMultipathResilience", Core::QueryValue.bool(value)}
      end

      if value = @accepter_multipath_resilience_mode
        params << {"#{prefix}AccepterMultipathResilienceMode", value.to_json_object_key}
      end

      if value = @multipath_resilience_status
        params << {"#{prefix}MultipathResilienceStatus", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dynamic_routing: (n = node.xpath_node("*[local-name()='dynamicRouting']")) ? AEC::DynamicRoutingValue.from_json_object_key?(n.content) : nil,
        requester_allow_multipath_resilience: Core::XMLValue.bool(node.xpath_node("*[local-name()='requesterAllowMultipathResilience']")),
        requester_multipath_resilience_mode: (n = node.xpath_node("*[local-name()='requesterMultipathResilienceMode']")) ? AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode.from_json_object_key?(n.content) : nil,
        accepter_allow_multipath_resilience: Core::XMLValue.bool(node.xpath_node("*[local-name()='accepterAllowMultipathResilience']")),
        accepter_multipath_resilience_mode: (n = node.xpath_node("*[local-name()='accepterMultipathResilienceMode']")) ? AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode.from_json_object_key?(n.content) : nil,
        multipath_resilience_status: (n = node.xpath_node("*[local-name()='multipathResilienceStatus']")) ? AEC::TransitGatewayPeeringAttachmentMultipathResilienceStatus.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dynamic_routing, @requester_allow_multipath_resilience, @requester_multipath_resilience_mode, @accepter_allow_multipath_resilience, @accepter_multipath_resilience_mode, @multipath_resilience_status)
  end
end
