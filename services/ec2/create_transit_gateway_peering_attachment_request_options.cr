private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes whether dynamic routing is enabled or disabled for the transit gateway peering
  # request.
  class CreateTransitGatewayPeeringAttachmentRequestOptions
    # Indicates whether dynamic routing is enabled or disabled.
    property dynamic_routing : DynamicRoutingValue | Nil

    # Specifies whether you allow multipath resilience for the requester side of the transit gateway
    # peering attachment. Multipath resilience is supported only for inter-Region transit gateway
    # peering attachments between supported Regions. It takes effect only when both the requester and
    # the accepter allow it. If you don't specify this parameter, the default is `false`.
    property allow_multipath_resilience : Bool | Nil

    # The multipath resilience mode. You can specify this parameter only if `AllowMultipathResilience`
    # is `true`.
    #
    # The following value is valid:
    #
    # - `always-on` – Replicates traffic across multiple network paths while multipath resilience is
    # in effect.
    #
    # If `AllowMultipathResilience` is `true` and you don't specify a mode, the default is
    # `always-on`.
    property multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil

    def initialize(
      @dynamic_routing : DynamicRoutingValue | Nil = nil,
      @allow_multipath_resilience : Bool | Nil = nil,
      @multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dynamic_routing
        params << {"#{prefix}DynamicRouting", value.to_json_object_key}
      end

      if value = @allow_multipath_resilience
        params << {"#{prefix}AllowMultipathResilience", Core::QueryValue.bool(value)}
      end

      if value = @multipath_resilience_mode
        params << {"#{prefix}MultipathResilienceMode", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dynamic_routing: (n = node.xpath_node("*[local-name()='DynamicRouting']")) ? AEC::DynamicRoutingValue.from_json_object_key?(n.content) : nil,
        allow_multipath_resilience: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowMultipathResilience']")),
        multipath_resilience_mode: (n = node.xpath_node("*[local-name()='MultipathResilienceMode']")) ? AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dynamic_routing, @allow_multipath_resilience, @multipath_resilience_mode)
  end
end
