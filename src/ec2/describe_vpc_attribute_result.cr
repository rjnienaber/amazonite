private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeVpcAttributeResult
    # Indicates whether the instances launched in the VPC get DNS hostnames. If this attribute is
    # `true`, instances in the VPC get DNS hostnames; otherwise, they do not.
    property enable_dns_hostnames : AttributeBooleanValue | Nil

    # Indicates whether DNS resolution is enabled for the VPC. If this attribute is `true`, the Amazon
    # DNS server resolves DNS hostnames for your instances to their corresponding IP addresses;
    # otherwise, it does not.
    property enable_dns_support : AttributeBooleanValue | Nil

    # Indicates whether Network Address Usage metrics are enabled for your VPC.
    property enable_network_address_usage_metrics : AttributeBooleanValue | Nil

    # The ID of the VPC.
    property vpc_id : String | Nil

    def initialize(
      @enable_dns_hostnames : AttributeBooleanValue | Nil = nil,
      @enable_dns_support : AttributeBooleanValue | Nil = nil,
      @enable_network_address_usage_metrics : AttributeBooleanValue | Nil = nil,
      @vpc_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @enable_dns_hostnames
        params.concat(value.to_query_params("#{prefix}EnableDnsHostnames."))
      end

      if value = @enable_dns_support
        params.concat(value.to_query_params("#{prefix}EnableDnsSupport."))
      end

      if value = @enable_network_address_usage_metrics
        params.concat(value.to_query_params("#{prefix}EnableNetworkAddressUsageMetrics."))
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enable_dns_hostnames: node.xpath_node("*[local-name()='enableDnsHostnames']").try { |n| AttributeBooleanValue.from_xml(n) },
        enable_dns_support: node.xpath_node("*[local-name()='enableDnsSupport']").try { |n| AttributeBooleanValue.from_xml(n) },
        enable_network_address_usage_metrics: node.xpath_node("*[local-name()='enableNetworkAddressUsageMetrics']").try { |n| AttributeBooleanValue.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
      )
    end

    def validate! : Nil
      if value = @enable_dns_hostnames
        value.validate!
      end

      if value = @enable_dns_support
        value.validate!
      end

      if value = @enable_network_address_usage_metrics
        value.validate!
      end
    end

    def_equals_and_hash(@enable_dns_hostnames, @enable_dns_support, @enable_network_address_usage_metrics, @vpc_id)
  end
end
