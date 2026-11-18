private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The VPC peering connection options.
  class PeeringConnectionOptionsRequest
    # If true, enables a local VPC to resolve public DNS hostnames to private IP addresses when
    # queried from instances in the peer VPC.
    property allow_dns_resolution_from_remote_vpc : Bool | Nil

    # Deprecated.
    property allow_egress_from_local_classic_link_to_remote_vpc : Bool | Nil

    # Deprecated.
    property allow_egress_from_local_vpc_to_remote_classic_link : Bool | Nil

    # Specifies whether you allow multipath resilience for this side of the VPC peering connection.
    # Multipath resilience is supported only for inter-Region VPC peering connections between
    # supported Regions. It takes effect only when both the requester and the accepter allow it. If
    # you don't specify this parameter, the current setting doesn't change.
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
      @allow_dns_resolution_from_remote_vpc : Bool | Nil = nil,
      @allow_egress_from_local_classic_link_to_remote_vpc : Bool | Nil = nil,
      @allow_egress_from_local_vpc_to_remote_classic_link : Bool | Nil = nil,
      @allow_multipath_resilience : Bool | Nil = nil,
      @multipath_resilience_mode : MultipathResilienceMode | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @allow_dns_resolution_from_remote_vpc
        params << {"#{prefix}AllowDnsResolutionFromRemoteVpc", Core::QueryValue.bool(value)}
      end

      if value = @allow_egress_from_local_classic_link_to_remote_vpc
        params << {"#{prefix}AllowEgressFromLocalClassicLinkToRemoteVpc", Core::QueryValue.bool(value)}
      end

      if value = @allow_egress_from_local_vpc_to_remote_classic_link
        params << {"#{prefix}AllowEgressFromLocalVpcToRemoteClassicLink", Core::QueryValue.bool(value)}
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
        allow_dns_resolution_from_remote_vpc: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowDnsResolutionFromRemoteVpc']")),
        allow_egress_from_local_classic_link_to_remote_vpc: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowEgressFromLocalClassicLinkToRemoteVpc']")),
        allow_egress_from_local_vpc_to_remote_classic_link: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowEgressFromLocalVpcToRemoteClassicLink']")),
        allow_multipath_resilience: Core::XMLValue.bool(node.xpath_node("*[local-name()='AllowMultipathResilience']")),
        multipath_resilience_mode: (n = node.xpath_node("*[local-name()='MultipathResilienceMode']")) ? AEC::MultipathResilienceMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allow_dns_resolution_from_remote_vpc, @allow_egress_from_local_classic_link_to_remote_vpc, @allow_egress_from_local_vpc_to_remote_classic_link, @allow_multipath_resilience, @multipath_resilience_mode)
  end
end
