private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the options for a VPC attachment.
  class ModifyTransitGatewayVpcAttachmentRequestOptions
    # Enable or disable DNS support. The default is `enable`.
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

    # Specifies whether IPv6 support is enabled for the attachment. When enabled, the transit gateway
    # network interface receives an IPv6 address. When you enable route propagation, IPv6 VPC CIDRs
    # propagate to the transit gateway route tables. When disabled, the network interface does not
    # receive an IPv6 address, and IPv6 routes do not propagate. The setting does not filter IPv6
    # traffic.
    property ipv_6_support : Ipv6SupportValue | Nil

    # Enable or disable support for appliance mode. If enabled, a traffic flow between a source and
    # destination uses the same Availability Zone for the VPC attachment for the lifetime of that
    # flow. The default is `disable`.
    property appliance_mode_support : ApplianceModeSupportValue | Nil

    def initialize(
      @dns_support : DnsSupportValue | Nil = nil,
      @security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil = nil,
      @ipv_6_support : Ipv6SupportValue | Nil = nil,
      @appliance_mode_support : ApplianceModeSupportValue | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dns_support
        params << {"#{prefix}DnsSupport", value.to_json_object_key}
      end

      if value = @security_group_referencing_support
        params << {"#{prefix}SecurityGroupReferencingSupport", value.to_json_object_key}
      end

      if value = @ipv_6_support
        params << {"#{prefix}Ipv6Support", value.to_json_object_key}
      end

      if value = @appliance_mode_support
        params << {"#{prefix}ApplianceModeSupport", value.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dns_support: (n = node.xpath_node("*[local-name()='DnsSupport']")) ? AEC::DnsSupportValue.from_json_object_key?(n.content) : nil,
        security_group_referencing_support: (n = node.xpath_node("*[local-name()='SecurityGroupReferencingSupport']")) ? AEC::SecurityGroupReferencingSupportValue.from_json_object_key?(n.content) : nil,
        ipv_6_support: (n = node.xpath_node("*[local-name()='Ipv6Support']")) ? AEC::Ipv6SupportValue.from_json_object_key?(n.content) : nil,
        appliance_mode_support: (n = node.xpath_node("*[local-name()='ApplianceModeSupport']")) ? AEC::ApplianceModeSupportValue.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dns_support, @security_group_referencing_support, @ipv_6_support, @appliance_mode_support)
  end
end
