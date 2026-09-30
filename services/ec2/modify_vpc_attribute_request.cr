private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyVpcAttributeRequest
    # Indicates whether the instances launched in the VPC get DNS hostnames. If enabled, instances in
    # the VPC get DNS hostnames; otherwise, they do not.
    #
    # You cannot modify the DNS resolution and DNS hostnames attributes in the same request. Use
    # separate requests for each attribute. You can only enable DNS hostnames if you've enabled DNS
    # support.
    property enable_dns_hostnames : AttributeBooleanValue | Nil

    # Indicates whether the DNS resolution is supported for the VPC. If enabled, queries to the Amazon
    # provided DNS server at the 169.254.169.253 IP address, or the reserved IP address at the base of
    # the VPC network range "plus two" succeed. If disabled, the Amazon provided DNS service in the
    # VPC that resolves public DNS hostnames to IP addresses is not enabled.
    #
    # You cannot modify the DNS resolution and DNS hostnames attributes in the same request. Use
    # separate requests for each attribute.
    property enable_dns_support : AttributeBooleanValue | Nil

    # The ID of the VPC.
    property vpc_id : String

    # Indicates whether Network Address Usage metrics are enabled for your VPC.
    property enable_network_address_usage_metrics : AttributeBooleanValue | Nil

    def initialize(
      @vpc_id : String,
      @enable_dns_hostnames : AttributeBooleanValue | Nil = nil,
      @enable_dns_support : AttributeBooleanValue | Nil = nil,
      @enable_network_address_usage_metrics : AttributeBooleanValue | Nil = nil,
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

      params << {"#{prefix}VpcId", @vpc_id}

      if value = @enable_network_address_usage_metrics
        params.concat(value.to_query_params("#{prefix}EnableNetworkAddressUsageMetrics."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        enable_dns_hostnames: node.xpath_node("*[local-name()='EnableDnsHostnames']").try { |n| AttributeBooleanValue.from_xml(n) },
        enable_dns_support: node.xpath_node("*[local-name()='EnableDnsSupport']").try { |n| AttributeBooleanValue.from_xml(n) },
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")).not_nil!,
        enable_network_address_usage_metrics: node.xpath_node("*[local-name()='EnableNetworkAddressUsageMetrics']").try { |n| AttributeBooleanValue.from_xml(n) },
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

    def_equals_and_hash(@enable_dns_hostnames, @enable_dns_support, @vpc_id, @enable_network_address_usage_metrics)
  end
end
