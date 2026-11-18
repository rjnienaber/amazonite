private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The VPC peering connection options to apply to the requester VPC when you create a VPC peering
  # connection.
  class CreatePeeringConnectionOptionsRequest
    # Specifies whether you allow multipath resilience for the requester VPC. Multipath resilience is
    # supported only for inter-Region VPC peering connections between supported Regions. It takes
    # effect only when both the requester and the accepter allow it. Accepting the VPC peering
    # connection request also allows multipath resilience for the accepter VPC. If you don't specify
    # this parameter, the default is `false`.
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
    property multipath_resilience_mode : MultipathResilienceMode | Nil

    def initialize(
      @allow_multipath_resilience : Bool | Nil = nil,
      @multipath_resilience_mode : MultipathResilienceMode | Nil = nil,
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
        multipath_resilience_mode: (n = node.xpath_node("*[local-name()='MultipathResilienceMode']")) ? AEC::MultipathResilienceMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allow_multipath_resilience, @multipath_resilience_mode)
  end
end
