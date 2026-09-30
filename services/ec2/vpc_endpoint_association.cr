private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the VPC resources, VPC endpoint services, Lattice services, or service networks
  # associated with the VPC endpoint.
  class VpcEndpointAssociation
    # The ID of the VPC endpoint association.
    property id : String | Nil

    # The ID of the VPC endpoint.
    property vpc_endpoint_id : String | Nil

    # The Amazon Resource Name (ARN) of the service network.
    property service_network_arn : String | Nil

    # The name of the service network.
    property service_network_name : String | Nil

    # The connectivity status of the resources associated to a VPC endpoint. The resource is
    # accessible if the associated resource configuration is `AVAILABLE`, otherwise the resource is
    # inaccessible.
    property associated_resource_accessibility : String | Nil

    # A message related to why an VPC endpoint association failed.
    property failure_reason : String | Nil

    # An error code related to why an VPC endpoint association failed.
    property failure_code : String | Nil

    # The DNS entry of the VPC endpoint association.
    property dns_entry : DnsEntry | Nil

    # The private DNS entry of the VPC endpoint association.
    property private_dns_entry : DnsEntry | Nil

    # The Amazon Resource Name (ARN) of the associated resource.
    property associated_resource_arn : String | Nil

    # The Amazon Resource Name (ARN) of the resource configuration group.
    property resource_configuration_group_arn : String | Nil

    # The tags to apply to the VPC endpoint association.
    property tags : Array(Tag) | Nil

    def initialize(
      @id : String | Nil = nil,
      @vpc_endpoint_id : String | Nil = nil,
      @service_network_arn : String | Nil = nil,
      @service_network_name : String | Nil = nil,
      @associated_resource_accessibility : String | Nil = nil,
      @failure_reason : String | Nil = nil,
      @failure_code : String | Nil = nil,
      @dns_entry : DnsEntry | Nil = nil,
      @private_dns_entry : DnsEntry | Nil = nil,
      @associated_resource_arn : String | Nil = nil,
      @resource_configuration_group_arn : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @id
        params << {"#{prefix}Id", value}
      end

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      if value = @service_network_arn
        params << {"#{prefix}ServiceNetworkArn", value}
      end

      if value = @service_network_name
        params << {"#{prefix}ServiceNetworkName", value}
      end

      if value = @associated_resource_accessibility
        params << {"#{prefix}AssociatedResourceAccessibility", value}
      end

      if value = @failure_reason
        params << {"#{prefix}FailureReason", value}
      end

      if value = @failure_code
        params << {"#{prefix}FailureCode", value}
      end

      if value = @dns_entry
        params.concat(value.to_query_params("#{prefix}DnsEntry."))
      end

      if value = @private_dns_entry
        params.concat(value.to_query_params("#{prefix}PrivateDnsEntry."))
      end

      if value = @associated_resource_arn
        params << {"#{prefix}AssociatedResourceArn", value}
      end

      if value = @resource_configuration_group_arn
        params << {"#{prefix}ResourceConfigurationGroupArn", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        id: Core::XMLValue.string(node.xpath_node("*[local-name()='id']")),
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointId']")),
        service_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceNetworkArn']")),
        service_network_name: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceNetworkName']")),
        associated_resource_accessibility: Core::XMLValue.string(node.xpath_node("*[local-name()='associatedResourceAccessibility']")),
        failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='failureReason']")),
        failure_code: Core::XMLValue.string(node.xpath_node("*[local-name()='failureCode']")),
        dns_entry: node.xpath_node("*[local-name()='dnsEntry']").try { |n| DnsEntry.from_xml(n) },
        private_dns_entry: node.xpath_node("*[local-name()='privateDnsEntry']").try { |n| DnsEntry.from_xml(n) },
        associated_resource_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='associatedResourceArn']")),
        resource_configuration_group_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceConfigurationGroupArn']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @dns_entry
        value.validate!
      end

      if value = @private_dns_entry
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@id, @vpc_endpoint_id, @service_network_arn, @service_network_name, @associated_resource_accessibility, @failure_reason, @failure_code, @dns_entry, @private_dns_entry, @associated_resource_arn, @resource_configuration_group_arn, @tags)
  end
end
