private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # The transit gateway options.
  class ModifyTransitGatewayOptions
    # Adds IPv4 or IPv6 CIDR blocks for the transit gateway. Must be a size /24 CIDR block or larger
    # for IPv4, or a size /64 CIDR block or larger for IPv6.
    property add_transit_gateway_cidr_blocks : Array(String) | Nil

    # Removes CIDR blocks for the transit gateway.
    property remove_transit_gateway_cidr_blocks : Array(String) | Nil

    # Enable or disable Equal Cost Multipath Protocol support.
    property vpn_ecmp_support : VpnEcmpSupportValue | Nil

    # Enable or disable DNS support.
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

    # Enable or disable automatic acceptance of attachment requests.
    property auto_accept_shared_attachments : AutoAcceptSharedAttachmentsValue | Nil

    # Enable or disable automatic association with the default association route table.
    property default_route_table_association : DefaultRouteTableAssociationValue | Nil

    # The ID of the default association route table.
    property association_default_route_table_id : String | Nil

    # Indicates whether resource attachments automatically propagate routes to the default propagation
    # route table. Enabled by default. If `defaultRouteTablePropagation` is set to `enable`, Amazon
    # Web Services Transit Gateway will create the default transit gateway route table.
    property default_route_table_propagation : DefaultRouteTablePropagationValue | Nil

    # The ID of the default propagation route table.
    property propagation_default_route_table_id : String | Nil

    # A private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is
    # 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs.
    #
    # The modify ASN operation is not allowed on a transit gateway if it has the following
    # attachments:
    #
    # - Dynamic VPN
    #
    # - Static VPN
    #
    # - Direct Connect Gateway
    #
    # - Connect
    #
    # - VPN Concentrator
    #
    # - Client VPN
    #
    # You must first delete all transit gateway attachments configured prior to modifying the ASN on
    # the transit gateway.
    property amazon_side_asn : Int64 | Nil

    # Enable or disable encryption support for VPC Encryption Control.
    property encryption_support : EncryptionSupportOptionValue | Nil

    def initialize(
      @add_transit_gateway_cidr_blocks : Array(String) | Nil = nil,
      @remove_transit_gateway_cidr_blocks : Array(String) | Nil = nil,
      @vpn_ecmp_support : VpnEcmpSupportValue | Nil = nil,
      @dns_support : DnsSupportValue | Nil = nil,
      @security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil = nil,
      @auto_accept_shared_attachments : AutoAcceptSharedAttachmentsValue | Nil = nil,
      @default_route_table_association : DefaultRouteTableAssociationValue | Nil = nil,
      @association_default_route_table_id : String | Nil = nil,
      @default_route_table_propagation : DefaultRouteTablePropagationValue | Nil = nil,
      @propagation_default_route_table_id : String | Nil = nil,
      @amazon_side_asn : Int64 | Nil = nil,
      @encryption_support : EncryptionSupportOptionValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@add_transit_gateway_cidr_blocks || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AddTransitGatewayCidrBlocks.#{i}", item}
      end

      (@remove_transit_gateway_cidr_blocks || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RemoveTransitGatewayCidrBlocks.#{i}", item}
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

      if value = @auto_accept_shared_attachments
        params << {"#{prefix}AutoAcceptSharedAttachments", value.to_json_object_key}
      end

      if value = @default_route_table_association
        params << {"#{prefix}DefaultRouteTableAssociation", value.to_json_object_key}
      end

      if value = @association_default_route_table_id
        params << {"#{prefix}AssociationDefaultRouteTableId", value}
      end

      if value = @default_route_table_propagation
        params << {"#{prefix}DefaultRouteTablePropagation", value.to_json_object_key}
      end

      if value = @propagation_default_route_table_id
        params << {"#{prefix}PropagationDefaultRouteTableId", value}
      end

      if value = @amazon_side_asn
        params << {"#{prefix}AmazonSideAsn", value.to_s}
      end

      if value = @encryption_support
        params << {"#{prefix}EncryptionSupport", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        add_transit_gateway_cidr_blocks: node.xpath_nodes("*[local-name()='AddTransitGatewayCidrBlocks']/*[local-name()='item']").map { |n| n.content },
        remove_transit_gateway_cidr_blocks: node.xpath_nodes("*[local-name()='RemoveTransitGatewayCidrBlocks']/*[local-name()='item']").map { |n| n.content },
        vpn_ecmp_support: (n = node.xpath_node("*[local-name()='VpnEcmpSupport']")) ? AEC::VpnEcmpSupportValue.from_json_object_key?(n.content) : nil,
        dns_support: (n = node.xpath_node("*[local-name()='DnsSupport']")) ? AEC::DnsSupportValue.from_json_object_key?(n.content) : nil,
        security_group_referencing_support: (n = node.xpath_node("*[local-name()='SecurityGroupReferencingSupport']")) ? AEC::SecurityGroupReferencingSupportValue.from_json_object_key?(n.content) : nil,
        auto_accept_shared_attachments: (n = node.xpath_node("*[local-name()='AutoAcceptSharedAttachments']")) ? AEC::AutoAcceptSharedAttachmentsValue.from_json_object_key?(n.content) : nil,
        default_route_table_association: (n = node.xpath_node("*[local-name()='DefaultRouteTableAssociation']")) ? AEC::DefaultRouteTableAssociationValue.from_json_object_key?(n.content) : nil,
        association_default_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AssociationDefaultRouteTableId']")),
        default_route_table_propagation: (n = node.xpath_node("*[local-name()='DefaultRouteTablePropagation']")) ? AEC::DefaultRouteTablePropagationValue.from_json_object_key?(n.content) : nil,
        propagation_default_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PropagationDefaultRouteTableId']")),
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='AmazonSideAsn']")),
        encryption_support: (n = node.xpath_node("*[local-name()='EncryptionSupport']")) ? AEC::EncryptionSupportOptionValue.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@add_transit_gateway_cidr_blocks, @remove_transit_gateway_cidr_blocks, @vpn_ecmp_support, @dns_support, @security_group_referencing_support, @auto_accept_shared_attachments, @default_route_table_association, @association_default_route_table_id, @default_route_table_propagation, @propagation_default_route_table_id, @amazon_side_asn, @encryption_support)
  end
end
