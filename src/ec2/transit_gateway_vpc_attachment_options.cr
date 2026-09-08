private alias AEC = Amazonite::EC2

module Amazonite::EC2
  # Describes the VPC attachment options.
  class TransitGatewayVpcAttachmentOptions
    # Indicates whether DNS support is enabled.
    property dns_support : DnsSupportValue | Nil

    # Enables you to reference a security group across VPCs attached to a transit gateway to simplify
    # security group management.
    #
    # This option is enabled by default.
    #
    # For more information about security group referencing, see [Security group
    # referencing](https://docs.aws.amazon.com/vpc/latest/tgw/tgw-vpc-attachments.html#vpc-attachment-security)
    # in the *Amazon Web Services Transit Gateways Guide*.
    property security_group_referencing_support : SecurityGroupReferencingSupportValue | Nil

    # Indicates whether IPv6 support is disabled.
    property ipv_6_support : Ipv6SupportValue | Nil

    # Indicates whether appliance mode support is enabled.
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
        dns_support: (n = node.xpath_node("*[local-name()='dnsSupport']")) ? AEC::DnsSupportValue.from_json_object_key?(n.content) : nil,
        security_group_referencing_support: (n = node.xpath_node("*[local-name()='securityGroupReferencingSupport']")) ? AEC::SecurityGroupReferencingSupportValue.from_json_object_key?(n.content) : nil,
        ipv_6_support: (n = node.xpath_node("*[local-name()='ipv6Support']")) ? AEC::Ipv6SupportValue.from_json_object_key?(n.content) : nil,
        appliance_mode_support: (n = node.xpath_node("*[local-name()='applianceModeSupport']")) ? AEC::ApplianceModeSupportValue.from_json_object_key?(n.content) : nil,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dns_support, @security_group_referencing_support, @ipv_6_support, @appliance_mode_support)
  end
end
