private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the options to modify for a transit gateway peering attachment, including multipath
  # resilience settings.
  class ModifyTransitGatewayPeeringAttachmentRequestOptions
    # Specifies whether you allow multipath resilience for your side of the transit gateway peering
    # attachment. Multipath resilience is supported only for inter-Region transit gateway peering
    # attachments between supported Regions. It takes effect only when both the requester and the
    # accepter allow it. If you don't specify this parameter, the current setting doesn't change.
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
      @allow_multipath_resilience : Bool | Nil = nil,
      @multipath_resilience_mode : TransitGatewayPeeringAttachmentMultipathResilienceMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

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
        allow_multipath_resilience: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowMultipathResilience']")),
        multipath_resilience_mode: (n = node.xpath_node("*[local-name()='MultipathResilienceMode']")) ? AEC::TransitGatewayPeeringAttachmentMultipathResilienceMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allow_multipath_resilience, @multipath_resilience_mode)
  end
end
