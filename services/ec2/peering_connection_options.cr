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

    def initialize(
      @allow_dns_resolution_from_remote_vpc : Bool | Nil = nil,
      @allow_egress_from_local_classic_link_to_remote_vpc : Bool | Nil = nil,
      @allow_egress_from_local_vpc_to_remote_classic_link : Bool | Nil = nil,
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
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        allow_dns_resolution_from_remote_vpc: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowDnsResolutionFromRemoteVpc']")),
        allow_egress_from_local_classic_link_to_remote_vpc: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowEgressFromLocalClassicLinkToRemoteVpc']")),
        allow_egress_from_local_vpc_to_remote_classic_link: Core::XMLValue.bool(node.xpath_node("*[local-name()='allowEgressFromLocalVpcToRemoteClassicLink']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@allow_dns_resolution_from_remote_vpc, @allow_egress_from_local_classic_link_to_remote_vpc, @allow_egress_from_local_vpc_to_remote_classic_link)
  end
end
