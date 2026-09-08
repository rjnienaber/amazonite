private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the options for a transit gateway.
  class TransitGatewayOptions
    # A private Autonomous System Number (ASN) for the Amazon side of a BGP session. The range is
    # 64512 to 65534 for 16-bit ASNs and 4200000000 to 4294967294 for 32-bit ASNs.
    property amazon_side_asn : Int64 | Nil

    # The transit gateway CIDR blocks.
    property transit_gateway_cidr_blocks : Array(String) | Nil

    # Indicates whether attachment requests are automatically accepted.
    property auto_accept_shared_attachments : AutoAcceptSharedAttachmentsValue | Nil

    # Indicates whether resource attachments are automatically associated with the default association
    # route table. Enabled by default. Either `defaultRouteTableAssociation` or
    # `defaultRouteTablePropagation` must be set to `enable` for Amazon Web Services Transit Gateway
    # to create the default transit gateway route table.
    property default_route_table_association : DefaultRouteTableAssociationValue | Nil

    # The ID of the default association route table.
    property association_default_route_table_id : String | Nil

    # Indicates whether resource attachments automatically propagate routes to the default propagation
    # route table. Enabled by default. If `defaultRouteTablePropagation` is set to `enable`, Amazon
    # Web Services Transit Gateway creates the default transit gateway route table.
    property default_route_table_propagation : DefaultRouteTablePropagationValue | Nil

    # The ID of the default propagation route table.
    property propagation_default_route_table_id : String | Nil

    # Indicates whether Equal Cost Multipath Protocol support is enabled.
    property vpn_ecmp_support : VpnEcmpSupportValue | Nil

    # Indicates whether DNS support is enabled.
    property dns_support : DnsSupportValue | Nil

    # Enables you to reference a security group across VPCs attached to a transit gateway to simplify
    # security group management.
    #
    # This option is disabled by default.
    property security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil

    # Indicates whether multicast is enabled on the transit gateway
    property multicast_support : MulticastSupportValue | Nil

    # Defines if the Transit Gateway supports VPC Encryption Control.
    property encryption_support : EncryptionSupport | Nil

    def initialize(
      @amazon_side_asn : Int64 | Nil = nil,
      @transit_gateway_cidr_blocks : Array(String) | Nil = nil,
      @auto_accept_shared_attachments : AutoAcceptSharedAttachmentsValue | Nil = nil,
      @default_route_table_association : DefaultRouteTableAssociationValue | Nil = nil,
      @association_default_route_table_id : String | Nil = nil,
      @default_route_table_propagation : DefaultRouteTablePropagationValue | Nil = nil,
      @propagation_default_route_table_id : String | Nil = nil,
      @vpn_ecmp_support : VpnEcmpSupportValue | Nil = nil,
      @dns_support : DnsSupportValue | Nil = nil,
      @security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil = nil,
      @multicast_support : MulticastSupportValue | Nil = nil,
      @encryption_support : EncryptionSupport | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @amazon_side_asn
        params << {"#{prefix}AmazonSideAsn", value.to_s}
      end

      (@transit_gateway_cidr_blocks || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}TransitGatewayCidrBlocks.#{i}", item}
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

      if value = @encryption_support
        params.concat(value.to_query_params("#{prefix}EncryptionSupport."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        amazon_side_asn: Core::XMLValue.i64(node.xpath_node("*[local-name()='amazonSideAsn']")),
        transit_gateway_cidr_blocks: node.xpath_nodes("*[local-name()='transitGatewayCidrBlocks']/*[local-name()='item']").map { |n| n.content },
        auto_accept_shared_attachments: (n = node.xpath_node("*[local-name()='autoAcceptSharedAttachments']")) ? AEC::AutoAcceptSharedAttachmentsValue.from_json_object_key?(n.content) : nil,
        default_route_table_association: (n = node.xpath_node("*[local-name()='defaultRouteTableAssociation']")) ? AEC::DefaultRouteTableAssociationValue.from_json_object_key?(n.content) : nil,
        association_default_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='associationDefaultRouteTableId']")),
        default_route_table_propagation: (n = node.xpath_node("*[local-name()='defaultRouteTablePropagation']")) ? AEC::DefaultRouteTablePropagationValue.from_json_object_key?(n.content) : nil,
        propagation_default_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='propagationDefaultRouteTableId']")),
        vpn_ecmp_support: (n = node.xpath_node("*[local-name()='vpnEcmpSupport']")) ? AEC::VpnEcmpSupportValue.from_json_object_key?(n.content) : nil,
        dns_support: (n = node.xpath_node("*[local-name()='dnsSupport']")) ? AEC::DnsSupportValue.from_json_object_key?(n.content) : nil,
        security_group_referencing_support: (n = node.xpath_node("*[local-name()='securityGroupReferencingSupport']")) ? AEC::SecurityGroupReferencingSupportValue.from_json_object_key?(n.content) : nil,
        multicast_support: (n = node.xpath_node("*[local-name()='multicastSupport']")) ? AEC::MulticastSupportValue.from_json_object_key?(n.content) : nil,
        encryption_support: node.xpath_node("*[local-name()='encryptionSupport']").try { |n| EncryptionSupport.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @encryption_support
        value.validate!
      end
    end

    def_equals_and_hash(@amazon_side_asn, @transit_gateway_cidr_blocks, @auto_accept_shared_attachments, @default_route_table_association, @association_default_route_table_id, @default_route_table_propagation, @propagation_default_route_table_id, @vpn_ecmp_support, @dns_support, @security_group_referencing_support, @multicast_support, @encryption_support)
  end
end
