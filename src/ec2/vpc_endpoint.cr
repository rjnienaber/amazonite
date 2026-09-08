private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC endpoint.
  class VpcEndpoint
    # The ID of the endpoint.
    property vpc_endpoint_id : String | Nil

    # The type of endpoint.
    property vpc_endpoint_type : VpcEndpointType | Nil

    # The ID of the VPC to which the endpoint is associated.
    property vpc_id : String | Nil

    # The name of the service to which the endpoint is associated.
    property service_name : String | Nil

    # The state of the endpoint.
    property state : State | Nil

    # The policy document associated with the endpoint, if applicable.
    property policy_document : String | Nil

    # (Gateway endpoint) The IDs of the route tables associated with the endpoint.
    property route_table_ids : Array(String) | Nil

    # (Interface endpoint) The subnets for the endpoint.
    property subnet_ids : Array(String) | Nil

    # (Interface endpoint) Information about the security groups that are associated with the network
    # interface.
    property groups : Array(SecurityGroupIdentifier) | Nil

    # The IP address type for the endpoint.
    property ip_address_type : IpAddressType | Nil

    # The DNS options for the endpoint.
    property dns_options : DnsOptions | Nil

    # (Interface endpoint) Indicates whether the VPC is associated with a private hosted zone.
    property private_dns_enabled : Bool | Nil

    # Indicates whether the endpoint is being managed by its service.
    property requester_managed : Bool | Nil

    # (Interface endpoint) The network interfaces for the endpoint.
    property network_interface_ids : Array(String) | Nil

    # (Interface endpoint) The DNS entries for the endpoint.
    property dns_entries : Array(DnsEntry) | Nil

    # The date and time that the endpoint was created.
    property creation_timestamp : Time | Nil

    # The tags assigned to the endpoint.
    property tags : Array(Tag) | Nil

    # The ID of the Amazon Web Services account that owns the endpoint.
    property owner_id : String | Nil

    # The last error that occurred for endpoint.
    property last_error : LastError | Nil

    # Array of IPv4 prefixes.
    property ipv_4_prefixes : Array(SubnetIpPrefixes) | Nil

    # Array of IPv6 prefixes.
    property ipv_6_prefixes : Array(SubnetIpPrefixes) | Nil

    # Reason for the failure.
    property failure_reason : String | Nil

    # The Amazon Resource Name (ARN) of the service network.
    property service_network_arn : String | Nil

    # The Amazon Resource Name (ARN) of the resource configuration.
    property resource_configuration_arn : String | Nil

    # The Region where the service is hosted.
    property service_region : String | Nil

    # The payer responsibility settings for the endpoint.
    property payer_responsibilities : Array(PayerResponsibilityEntry) | Nil

    def initialize(
      @vpc_endpoint_id : String | Nil = nil,
      @vpc_endpoint_type : VpcEndpointType | Nil = nil,
      @vpc_id : String | Nil = nil,
      @service_name : String | Nil = nil,
      @state : State | Nil = nil,
      @policy_document : String | Nil = nil,
      @route_table_ids : Array(String) | Nil = nil,
      @subnet_ids : Array(String) | Nil = nil,
      @groups : Array(SecurityGroupIdentifier) | Nil = nil,
      @ip_address_type : IpAddressType | Nil = nil,
      @dns_options : DnsOptions | Nil = nil,
      @private_dns_enabled : Bool | Nil = nil,
      @requester_managed : Bool | Nil = nil,
      @network_interface_ids : Array(String) | Nil = nil,
      @dns_entries : Array(DnsEntry) | Nil = nil,
      @creation_timestamp : Time | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @owner_id : String | Nil = nil,
      @last_error : LastError | Nil = nil,
      @ipv_4_prefixes : Array(SubnetIpPrefixes) | Nil = nil,
      @ipv_6_prefixes : Array(SubnetIpPrefixes) | Nil = nil,
      @failure_reason : String | Nil = nil,
      @service_network_arn : String | Nil = nil,
      @resource_configuration_arn : String | Nil = nil,
      @service_region : String | Nil = nil,
      @payer_responsibilities : Array(PayerResponsibilityEntry) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @vpc_endpoint_id
        params << {"#{prefix}VpcEndpointId", value}
      end

      if value = @vpc_endpoint_type
        params << {"#{prefix}VpcEndpointType", value.to_json_object_key}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @policy_document
        params << {"#{prefix}PolicyDocument", value}
      end

      (@route_table_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}RouteTableIdSet.#{i}", item}
      end

      (@subnet_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SubnetIdSet.#{i}", item}
      end

      (@groups || [] of SecurityGroupIdentifier).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}GroupSet.#{i}."))
      end

      if value = @ip_address_type
        params << {"#{prefix}IpAddressType", value.to_json_object_key}
      end

      if value = @dns_options
        params.concat(value.to_query_params("#{prefix}DnsOptions."))
      end

      if value = @private_dns_enabled
        params << {"#{prefix}PrivateDnsEnabled", Core::QueryValue.bool(value)}
      end

      if value = @requester_managed
        params << {"#{prefix}RequesterManaged", Core::QueryValue.bool(value)}
      end

      (@network_interface_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkInterfaceIdSet.#{i}", item}
      end

      (@dns_entries || [] of DnsEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}DnsEntrySet.#{i}."))
      end

      if value = @creation_timestamp
        params << {"#{prefix}CreationTimestamp", Core::QueryValue.time(value)}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @owner_id
        params << {"#{prefix}OwnerId", value}
      end

      if value = @last_error
        params.concat(value.to_query_params("#{prefix}LastError."))
      end

      (@ipv_4_prefixes || [] of SubnetIpPrefixes).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv4PrefixSet.#{i}."))
      end

      (@ipv_6_prefixes || [] of SubnetIpPrefixes).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6PrefixSet.#{i}."))
      end

      if value = @failure_reason
        params << {"#{prefix}FailureReason", value}
      end

      if value = @service_network_arn
        params << {"#{prefix}ServiceNetworkArn", value}
      end

      if value = @resource_configuration_arn
        params << {"#{prefix}ResourceConfigurationArn", value}
      end

      if value = @service_region
        params << {"#{prefix}ServiceRegion", value}
      end

      (@payer_responsibilities || [] of PayerResponsibilityEntry).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PayerResponsibilitySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        vpc_endpoint_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcEndpointId']")),
        vpc_endpoint_type: (n = node.xpath_node("*[local-name()='vpcEndpointType']")) ? AEC::VpcEndpointType.from_json_object_key?(n.content) : nil,
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceName']")),
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::State.from_json_object_key?(n.content) : nil,
        policy_document: Core::XMLValue.string(node.xpath_node("*[local-name()='policyDocument']")),
        route_table_ids: node.xpath_nodes("*[local-name()='routeTableIdSet']/*[local-name()='item']").map { |n| n.content },
        subnet_ids: node.xpath_nodes("*[local-name()='subnetIdSet']/*[local-name()='item']").map { |n| n.content },
        groups: node.xpath_nodes("*[local-name()='groupSet']/*[local-name()='item']").map { |n| SecurityGroupIdentifier.from_xml(n) },
        ip_address_type: (n = node.xpath_node("*[local-name()='ipAddressType']")) ? AEC::IpAddressType.from_json_object_key?(n.content) : nil,
        dns_options: node.xpath_node("*[local-name()='dnsOptions']").try { |n| DnsOptions.from_xml(n) },
        private_dns_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='privateDnsEnabled']")),
        requester_managed: Core::XMLValue.bool(node.xpath_node("*[local-name()='requesterManaged']")),
        network_interface_ids: node.xpath_nodes("*[local-name()='networkInterfaceIdSet']/*[local-name()='item']").map { |n| n.content },
        dns_entries: node.xpath_nodes("*[local-name()='dnsEntrySet']/*[local-name()='item']").map { |n| DnsEntry.from_xml(n) },
        creation_timestamp: Core::XMLValue.time(node.xpath_node("*[local-name()='creationTimestamp']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        owner_id: Core::XMLValue.string(node.xpath_node("*[local-name()='ownerId']")),
        last_error: node.xpath_node("*[local-name()='lastError']").try { |n| LastError.from_xml(n) },
        ipv_4_prefixes: node.xpath_nodes("*[local-name()='ipv4PrefixSet']/*[local-name()='item']").map { |n| SubnetIpPrefixes.from_xml(n) },
        ipv_6_prefixes: node.xpath_nodes("*[local-name()='ipv6PrefixSet']/*[local-name()='item']").map { |n| SubnetIpPrefixes.from_xml(n) },
        failure_reason: Core::XMLValue.string(node.xpath_node("*[local-name()='failureReason']")),
        service_network_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceNetworkArn']")),
        resource_configuration_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='resourceConfigurationArn']")),
        service_region: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceRegion']")),
        payer_responsibilities: node.xpath_nodes("*[local-name()='payerResponsibilitySet']/*[local-name()='item']").map { |n| PayerResponsibilityEntry.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @groups
        value.each(&.validate!)
      end

      if value = @dns_options
        value.validate!
      end

      if value = @dns_entries
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @last_error
        value.validate!
      end

      if value = @ipv_4_prefixes
        value.each(&.validate!)
      end

      if value = @ipv_6_prefixes
        value.each(&.validate!)
      end

      if value = @payer_responsibilities
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@vpc_endpoint_id, @vpc_endpoint_type, @vpc_id, @service_name, @state, @policy_document, @route_table_ids, @subnet_ids, @groups, @ip_address_type, @dns_options, @private_dns_enabled, @requester_managed, @network_interface_ids, @dns_entries, @creation_timestamp, @tags, @owner_id, @last_error, @ipv_4_prefixes, @ipv_6_prefixes, @failure_reason, @service_network_arn, @resource_configuration_arn, @service_region, @payer_responsibilities)
  end
end
