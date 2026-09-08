private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a service configuration for a VPC endpoint service.
  class ServiceConfiguration
    # The type of service.
    property service_type : Array(ServiceTypeDetail) | Nil

    # The ID of the service.
    property service_id : String | Nil

    # The name of the service.
    property service_name : String | Nil

    # The service state.
    property service_state : ServiceState | Nil

    # The IDs of the Availability Zones in which the service is available.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zone_ids : Array(String) | Nil

    # The Availability Zones in which the service is available.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zones : Array(String) | Nil

    # Indicates whether requests from other Amazon Web Services accounts to create an endpoint to the
    # service must first be accepted.
    property acceptance_required : Bool | Nil

    # Indicates whether the service manages its VPC endpoints. Management of the service VPC endpoints
    # using the VPC endpoint API is restricted.
    property manages_vpc_endpoints : Bool | Nil

    # The Amazon Resource Names (ARNs) of the Network Load Balancers for the service.
    property network_load_balancer_arns : Array(String) | Nil

    # The Amazon Resource Names (ARNs) of the Gateway Load Balancers for the service.
    property gateway_load_balancer_arns : Array(String) | Nil

    # The supported IP address types.
    property supported_ip_address_types : Array(ServiceConnectivityType) | Nil

    # The DNS names for the service.
    property base_endpoint_dns_names : Array(String) | Nil

    # The private DNS name for the service.
    property private_dns_name : String | Nil

    # Information about the endpoint service private DNS name configuration.
    property private_dns_name_configuration : PrivateDnsNameConfiguration | Nil

    # The payer responsibility.
    property payer_responsibility : PayerResponsibility | Nil

    # The tags assigned to the service.
    property tags : Array(Tag) | Nil

    # The supported Regions.
    property supported_regions : Array(SupportedRegionDetail) | Nil

    # Indicates whether consumers can access the service from a Region other than the Region where the
    # service is hosted.
    property remote_access_enabled : Bool | Nil

    def initialize(
      @service_type : Array(ServiceTypeDetail) | Nil = nil,
      @service_id : String | Nil = nil,
      @service_name : String | Nil = nil,
      @service_state : ServiceState | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @acceptance_required : Bool | Nil = nil,
      @manages_vpc_endpoints : Bool | Nil = nil,
      @network_load_balancer_arns : Array(String) | Nil = nil,
      @gateway_load_balancer_arns : Array(String) | Nil = nil,
      @supported_ip_address_types : Array(ServiceConnectivityType) | Nil = nil,
      @base_endpoint_dns_names : Array(String) | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @private_dns_name_configuration : PrivateDnsNameConfiguration | Nil = nil,
      @payer_responsibility : PayerResponsibility | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @supported_regions : Array(SupportedRegionDetail) | Nil = nil,
      @remote_access_enabled : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@service_type || [] of ServiceTypeDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ServiceType.#{i}."))
      end

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end

      if value = @service_state
        params << {"#{prefix}ServiceState", value.to_json_object_key}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneIdSet.#{i}", item}
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneSet.#{i}", item}
      end

      if value = @acceptance_required
        params << {"#{prefix}AcceptanceRequired", Core::QueryValue.bool(value)}
      end

      if value = @manages_vpc_endpoints
        params << {"#{prefix}ManagesVpcEndpoints", Core::QueryValue.bool(value)}
      end

      (@network_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}NetworkLoadBalancerArnSet.#{i}", item}
      end

      (@gateway_load_balancer_arns || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}GatewayLoadBalancerArnSet.#{i}", item}
      end

      (@supported_ip_address_types || [] of ServiceConnectivityType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedIpAddressTypeSet.#{i}", item.to_json_object_key}
      end

      (@base_endpoint_dns_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}BaseEndpointDnsNameSet.#{i}", item}
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      if value = @private_dns_name_configuration
        params.concat(value.to_query_params("#{prefix}PrivateDnsNameConfiguration."))
      end

      if value = @payer_responsibility
        params << {"#{prefix}PayerResponsibility", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      (@supported_regions || [] of SupportedRegionDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SupportedRegionSet.#{i}."))
      end

      if value = @remote_access_enabled
        params << {"#{prefix}RemoteAccessEnabled", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_type: node.xpath_nodes("*[local-name()='serviceType']/*[local-name()='item']").map { |n| ServiceTypeDetail.from_xml(n) },
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceId']")),
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceName']")),
        service_state: (n = node.xpath_node("*[local-name()='serviceState']")) ? AEC::ServiceState.from_json_object_key?(n.content) : nil,
        availability_zone_ids: node.xpath_nodes("*[local-name()='availabilityZoneIdSet']/*[local-name()='item']").map { |n| n.content },
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneSet']/*[local-name()='item']").map { |n| n.content },
        acceptance_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='acceptanceRequired']")),
        manages_vpc_endpoints: Core::XMLValue.bool(node.xpath_node("*[local-name()='managesVpcEndpoints']")),
        network_load_balancer_arns: node.xpath_nodes("*[local-name()='networkLoadBalancerArnSet']/*[local-name()='item']").map { |n| n.content },
        gateway_load_balancer_arns: node.xpath_nodes("*[local-name()='gatewayLoadBalancerArnSet']/*[local-name()='item']").map { |n| n.content },
        supported_ip_address_types: node.xpath_nodes("*[local-name()='supportedIpAddressTypeSet']/*[local-name()='item']").compact_map { |n| AEC::ServiceConnectivityType.from_json_object_key?(n.content) },
        base_endpoint_dns_names: node.xpath_nodes("*[local-name()='baseEndpointDnsNameSet']/*[local-name()='item']").map { |n| n.content },
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
        private_dns_name_configuration: node.xpath_node("*[local-name()='privateDnsNameConfiguration']").try { |n| PrivateDnsNameConfiguration.from_xml(n) },
        payer_responsibility: (n = node.xpath_node("*[local-name()='payerResponsibility']")) ? AEC::PayerResponsibility.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        supported_regions: node.xpath_nodes("*[local-name()='supportedRegionSet']/*[local-name()='item']").map { |n| SupportedRegionDetail.from_xml(n) },
        remote_access_enabled: Core::XMLValue.bool(node.xpath_node("*[local-name()='remoteAccessEnabled']")),
      )
    end

    def validate! : Nil
      if value = @service_type
        value.each(&.validate!)
      end

      if value = @supported_ip_address_types
        raise Core::ValidationError.new("SupportedIpAddressTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SupportedIpAddressTypes must have at most 2 item(s)") if value.size > 2
      end

      if value = @private_dns_name_configuration
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @supported_regions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@service_type, @service_id, @service_name, @service_state, @availability_zone_ids, @availability_zones, @acceptance_required, @manages_vpc_endpoints, @network_load_balancer_arns, @gateway_load_balancer_arns, @supported_ip_address_types, @base_endpoint_dns_names, @private_dns_name, @private_dns_name_configuration, @payer_responsibility, @tags, @supported_regions, @remote_access_enabled)
  end
end
