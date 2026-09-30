private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a VPC endpoint service.
  class ServiceDetail
    # The name of the service.
    property service_name : String | Nil

    # The ID of the endpoint service.
    property service_id : String | Nil

    # The type of service.
    property service_type : Array(ServiceTypeDetail) | Nil

    # The Region where the service is hosted.
    property service_region : String | Nil

    # The IDs of the Availability Zones in which the service is available.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zone_ids : Array(String) | Nil

    # The Availability Zones in which the service is available.
    #
    # Either `AvailabilityZone` or `AvailabilityZoneId` can be specified, but not both
    property availability_zones : Array(String) | Nil

    # The Amazon Web Services account ID of the service owner.
    property owner : String | Nil

    # The DNS names for the service.
    property base_endpoint_dns_names : Array(String) | Nil

    # The private DNS name for the service.
    property private_dns_name : String | Nil

    # The private DNS names assigned to the VPC endpoint service.
    property private_dns_names : Array(PrivateDnsDetails) | Nil

    # Indicates whether the service supports endpoint policies.
    property vpc_endpoint_policy_supported : Bool | Nil

    # Indicates whether VPC endpoint connection requests to the service must be accepted by the
    # service owner.
    property acceptance_required : Bool | Nil

    # Indicates whether the service manages its VPC endpoints. Management of the service VPC endpoints
    # using the VPC endpoint API is restricted.
    property manages_vpc_endpoints : Bool | Nil

    # The payer responsibility.
    property payer_responsibility : PayerResponsibility | Nil

    # The tags assigned to the service.
    property tags : Array(Tag) | Nil

    # The verification state of the VPC endpoint service.
    #
    # Consumers of the endpoint service cannot use the private name when the state is not `verified`.
    property private_dns_name_verification_state : DnsNameState | Nil

    # The supported IP address types.
    property supported_ip_address_types : Array(ServiceConnectivityType) | Nil

    def initialize(
      @service_name : String | Nil = nil,
      @service_id : String | Nil = nil,
      @service_type : Array(ServiceTypeDetail) | Nil = nil,
      @service_region : String | Nil = nil,
      @availability_zone_ids : Array(String) | Nil = nil,
      @availability_zones : Array(String) | Nil = nil,
      @owner : String | Nil = nil,
      @base_endpoint_dns_names : Array(String) | Nil = nil,
      @private_dns_name : String | Nil = nil,
      @private_dns_names : Array(PrivateDnsDetails) | Nil = nil,
      @vpc_endpoint_policy_supported : Bool | Nil = nil,
      @acceptance_required : Bool | Nil = nil,
      @manages_vpc_endpoints : Bool | Nil = nil,
      @payer_responsibility : PayerResponsibility | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @private_dns_name_verification_state : DnsNameState | Nil = nil,
      @supported_ip_address_types : Array(ServiceConnectivityType) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @service_name
        params << {"#{prefix}ServiceName", value}
      end

      if value = @service_id
        params << {"#{prefix}ServiceId", value}
      end

      (@service_type || [] of ServiceTypeDetail).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}ServiceType.#{i}."))
      end

      if value = @service_region
        params << {"#{prefix}ServiceRegion", value}
      end

      (@availability_zone_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneIdSet.#{i}", item}
      end

      (@availability_zones || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AvailabilityZoneSet.#{i}", item}
      end

      if value = @owner
        params << {"#{prefix}Owner", value}
      end

      (@base_endpoint_dns_names || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}BaseEndpointDnsNameSet.#{i}", item}
      end

      if value = @private_dns_name
        params << {"#{prefix}PrivateDnsName", value}
      end

      (@private_dns_names || [] of PrivateDnsDetails).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PrivateDnsNameSet.#{i}."))
      end

      if value = @vpc_endpoint_policy_supported
        params << {"#{prefix}VpcEndpointPolicySupported", Core::QueryValue.bool(value)}
      end

      if value = @acceptance_required
        params << {"#{prefix}AcceptanceRequired", Core::QueryValue.bool(value)}
      end

      if value = @manages_vpc_endpoints
        params << {"#{prefix}ManagesVpcEndpoints", Core::QueryValue.bool(value)}
      end

      if value = @payer_responsibility
        params << {"#{prefix}PayerResponsibility", value.to_json_object_key}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @private_dns_name_verification_state
        params << {"#{prefix}PrivateDnsNameVerificationState", value.to_json_object_key}
      end

      (@supported_ip_address_types || [] of ServiceConnectivityType).each_with_index(1) do |item, i|
        params << {"#{prefix}SupportedIpAddressTypeSet.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        service_name: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceName']")),
        service_id: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceId']")),
        service_type: node.xpath_nodes("*[local-name()='serviceType']/*[local-name()='item']").map { |n| ServiceTypeDetail.from_xml(n) },
        service_region: Core::XMLValue.string(node.xpath_node("*[local-name()='serviceRegion']")),
        availability_zone_ids: node.xpath_nodes("*[local-name()='availabilityZoneIdSet']/*[local-name()='item']").map { |n| n.content },
        availability_zones: node.xpath_nodes("*[local-name()='availabilityZoneSet']/*[local-name()='item']").map { |n| n.content },
        owner: Core::XMLValue.string(node.xpath_node("*[local-name()='owner']")),
        base_endpoint_dns_names: node.xpath_nodes("*[local-name()='baseEndpointDnsNameSet']/*[local-name()='item']").map { |n| n.content },
        private_dns_name: Core::XMLValue.string(node.xpath_node("*[local-name()='privateDnsName']")),
        private_dns_names: node.xpath_nodes("*[local-name()='privateDnsNameSet']/*[local-name()='item']").map { |n| PrivateDnsDetails.from_xml(n) },
        vpc_endpoint_policy_supported: Core::XMLValue.bool(node.xpath_node("*[local-name()='vpcEndpointPolicySupported']")),
        acceptance_required: Core::XMLValue.bool(node.xpath_node("*[local-name()='acceptanceRequired']")),
        manages_vpc_endpoints: Core::XMLValue.bool(node.xpath_node("*[local-name()='managesVpcEndpoints']")),
        payer_responsibility: (n = node.xpath_node("*[local-name()='payerResponsibility']")) ? AEC::PayerResponsibility.from_json_object_key?(n.content) : nil,
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        private_dns_name_verification_state: (n = node.xpath_node("*[local-name()='privateDnsNameVerificationState']")) ? AEC::DnsNameState.from_json_object_key?(n.content) : nil,
        supported_ip_address_types: node.xpath_nodes("*[local-name()='supportedIpAddressTypeSet']/*[local-name()='item']").compact_map { |n| AEC::ServiceConnectivityType.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
      if value = @service_type
        value.each(&.validate!)
      end

      if value = @private_dns_names
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @supported_ip_address_types
        raise Core::ValidationError.new("SupportedIpAddressTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SupportedIpAddressTypes must have at most 2 item(s)") if value.size > 2
      end
    end

    def_equals_and_hash(@service_name, @service_id, @service_type, @service_region, @availability_zone_ids, @availability_zones, @owner, @base_endpoint_dns_names, @private_dns_name, @private_dns_names, @vpc_endpoint_policy_supported, @acceptance_required, @manages_vpc_endpoints, @payer_responsibility, @tags, @private_dns_name_verification_state, @supported_ip_address_types)
  end
end
