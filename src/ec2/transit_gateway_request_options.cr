private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the options for a transit gateway.
  class TransitGatewayRequestOptions
    # A private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is
    # 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs. The default is
    # `64512`.
    property amazon_side_asn : Int64 | Nil

    # Enable or disable automatic acceptance of attachment requests. Disabled by default.
    property auto_accept_shared_attachments : AutoAcceptSharedAttachmentsValue | Nil

    # Enable or disable automatic association with the default association route table. Enabled by
    # default.
    property default_route_table_association : DefaultRouteTableAssociationValue | Nil

    # Enable or disable automatic propagation of routes to the default propagation route table.
    # Enabled by default.
    property default_route_table_propagation : DefaultRouteTablePropagationValue | Nil

    # Enable or disable Equal Cost Multipath Protocol support. Enabled by default.
    property vpn_ecmp_support : VpnEcmpSupportValue | Nil

    # Enable or disable DNS support. Enabled by default.
    property dns_support : DnsSupportValue | Nil

    # Enables you to reference a security group across VPCs attached to a transit gateway to simplify
    # security group management.
    #
    # This option is disabled by default.
    #
    # For more information about security group referencing, see [Security group
    # referencing](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-vpc-attachments.html#vpc-attachment-security)
    # in the *Amazon Web Services Transit Gateways Guide*.
    property security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil

    # Indicates whether multicast is enabled on the transit gateway
    property multicast_support : MulticastSupportValue | Nil

    # One or more IPv4 or IPv6 CIDR blocks for the transit gateway. Must be a size /24 CIDR block or
    # larger for IPv4, or a size /64 CIDR block or larger for IPv6.
    property transit_gateway_cidr_blocks : Array(String) | Nil

    def initialize(
      @amazon_side_asn : Int64 | Nil = nil,
      @auto_accept_shared_attachments : AutoAcceptSharedAttachmentsValue | Nil = nil,
      @default_route_table_association : DefaultRouteTableAssociationValue | Nil = nil,
      @default_route_table_propagation : DefaultRouteTablePropagationValue | Nil = nil,
      @vpn_ecmp_support : VpnEcmpSupportValue | Nil = nil,
      @dns_support : DnsSupportValue | Nil = nil,
      @security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil = nil,
      @multicast_support : MulticastSupportValue | Nil = nil,
      @transit_gateway_cidr_blocks : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @amazon_side_asn
        params << {"#{prefix}AmazonSideAsn", value.to_s}
      end

      if value = @auto_accept_shared_attachments
        params << {"#{prefix}AutoAcceptSharedAttachments", value.to_json_object_key}
      end

      if value = @default_route_table_association
        params << {"#{prefix}DefaultRouteTableAssociation", value.to_json_object_key}
      end

      if value = @default_route_table_propagation
        params << {"#{prefix}DefaultRouteTablePropagation", value.to_json_object_key}
      end

      if value = @vpn_ecmp_support
        params << {"#{prefix}VpnEcmpSupport", value.to_json_object_key}
      end

      if value = @dns_support
        params << {"#{prefix}DnsSupport", value.to_json_object_key}
      end

      if value = @security_group_referencing_support
        params << {"#{prefix}SecurityGroupReferencingSupport", value.to_json_object_key}
      end

      if value = @multicast_support
        params << {"#{prefix}MulticastSupport", value.to_json_object_key}
      end

      (@transit_gateway_cidr_blocks || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TransitGatewayCidrBlocks.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='AmazonSideAsn']")),
        auto_accept_shared_attachments: (n = node.xpath_node("*[local-name()='AutoAcceptSharedAttachments']")) ? AEC::AutoAcceptSharedAttachmentsValue.from_json_object_key?(n.content) : nil,
        default_route_table_association: (n = node.xpath_node("*[local-name()='DefaultRouteTableAssociation']")) ? AEC::DefaultRouteTableAssociationValue.from_json_object_key?(n.content) : nil,
        default_route_table_propagation: (n = node.xpath_node("*[local-name()='DefaultRouteTablePropagation']")) ? AEC::DefaultRouteTablePropagationValue.from_json_object_key?(n.content) : nil,
        vpn_ecmp_support: (n = node.xpath_node("*[local-name()='VpnEcmpSupport']")) ? AEC::VpnEcmpSupportValue.from_json_object_key?(n.content) : nil,
        dns_support: (n = node.xpath_node("*[local-name()='DnsSupport']")) ? AEC::DnsSupportValue.from_json_object_key?(n.content) : nil,
        security_group_referencing_support: (n = node.xpath_node("*[local-name()='SecurityGroupReferencingSupport']")) ? AEC::SecurityGroupReferencingSupportValue.from_json_object_key?(n.content) : nil,
        multicast_support: (n = node.xpath_node("*[local-name()='MulticastSupport']")) ? AEC::MulticastSupportValue.from_json_object_key?(n.content) : nil,
        transit_gateway_cidr_blocks: node.xpath_nodes("*[local-name()='TransitGatewayCidrBlocks']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@amazon_side_asn, @auto_accept_shared_attachments, @default_route_table_association, @default_route_table_propagation, @vpn_ecmp_support, @dns_support, @security_group_referencing_support, @multicast_support, @transit_gateway_cidr_blocks)
  end
end
