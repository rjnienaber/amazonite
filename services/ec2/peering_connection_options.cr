private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the VPC peering connection options.
  class PeeringConnectionOptions
    # If true, the public DNS hostnames of instances in the specified VPC resolve to private IP
    # addresses when queried from instances in the peer VPC.
    property allow_dns_resolution_from_remote_vpc : Bool | Nil

    # Deprecated.
    property allow_egress_from_local_classic_link_to_remote_vpc : Bool | Nil

    # Deprecated.
    property allow_egress_from_local_vpc_to_remote_classic_link : Bool | Nil

    # Indicates whether this side of the VPC peering connection allows multipath resilience.
    property allow_multipath_resilience : Bool | Nil

    # The multipath resilience mode for this side of the VPC peering connection. This value is present
    # only when this side allows multipath resilience.
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
        allow_dns_resolution_from_remote_vpc: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowDnsResolutionFromRemoteVpc']")),
        allow_egress_from_local_classic_link_to_remote_vpc: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowEgressFromLocalClassicLinkToRemoteVpc']")),
        allow_egress_from_local_vpc_to_remote_classic_link: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowEgressFromLocalVpcToRemoteClassicLink']")),
        allow_multipath_resilience: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowMultipathResilience']")),
        multipath_resilience_mode: (n = node.xpath_node("*[local-name()='multipathResilienceMode']")) ? AEC::MultipathResilienceMode.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allow_dns_resolution_from_remote_vpc, @allow_egress_from_local_classic_link_to_remote_vpc, @allow_egress_from_local_vpc_to_remote_classic_link, @allow_multipath_resilience, @multipath_resilience_mode)
  end
end
