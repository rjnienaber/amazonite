private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateNatGatewayRequest
    # Specifies whether to create a zonal (single-AZ) or regional (multi-AZ) NAT gateway. Defaults to
    # `zonal`.
    #
    # A zonal NAT gateway is a NAT Gateway that provides redundancy and scalability within a single
    # availability zone. A regional NAT gateway is a single NAT Gateway that works across multiple
    # availability zones (AZs) in your VPC, providing redundancy, scalability and availability across
    # all the AZs in a Region.
    #
    # For more information, see [Regional NAT gateways for automatic multi-AZ
    # expansion](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateways-regional.html) in the
    # *Amazon VPC User Guide*.
    property availability_mode : AvailabilityMode | Nil

    # [Public NAT gateways only] The allocation ID of an Elastic IP address to associate with the NAT
    # gateway. You cannot specify an Elastic IP address with a private NAT gateway. If the Elastic IP
    # address is associated with another resource, you must first disassociate it.
    property allocation_id : String | Nil

    # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. For
    # more information, see [Ensuring
    # idempotency](https://docs.aws.amazon.com/ec2/latest/devguide/ec2-api-idempotency.html).
    #
    # Constraint: Maximum 64 ASCII characters.
    property client_token : String | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the subnet in which to create the NAT gateway.
    property subnet_id : String | Nil

    # The ID of the VPC where you want to create a regional NAT gateway.
    property vpc_id : String | Nil

    # For regional NAT gateways only: Specifies which Availability Zones you want the NAT gateway to
    # support and the Elastic IP addresses (EIPs) to use in each AZ. The regional NAT gateway uses
    # these EIPs to handle outbound NAT traffic from their respective AZs. If not specified, the NAT
    # gateway will automatically expand to new AZs and associate EIPs upon detection of an elastic
    # network interface. If you specify this parameter, auto-expansion is disabled and you must
    # manually manage AZ coverage.
    #
    # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
    # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
    # Region.
    #
    # For more information, see [Regional NAT gateways for automatic multi-AZ
    # expansion](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateways-regional.html) in the
    # *Amazon VPC User Guide*.
    property availability_zone_addresses : Array(AvailabilityZoneAddress) | Nil

    # The tags to assign to the NAT gateway.
    property tag_specifications : Array(TagSpecification) | Nil

    # Indicates whether the NAT gateway supports public or private connectivity. The default is public
    # connectivity.
    property connectivity_type : ConnectivityType | Nil

    # The private IPv4 address to assign to the NAT gateway. If you don't provide an address, a
    # private IPv4 address will be automatically assigned.
    property private_ip_address : String | Nil

    # Secondary EIP allocation IDs. For more information, see [Create a NAT
    # gateway](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateway-working-with.html) in the
    # *Amazon VPC User Guide*.
    property secondary_allocation_ids : Array(String) | Nil

    # Secondary private IPv4 addresses. For more information about secondary addresses, see [Create a
    # NAT gateway](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateway-working-with.html) in
    # the *Amazon VPC User Guide*.
    property secondary_private_ip_addresses : Array(String) | Nil

    # [Private NAT gateway only] The number of secondary private IPv4 addresses you want to assign to
    # the NAT gateway. For more information about secondary addresses, see [Create a NAT
    # gateway](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateway-working-with.html) in the
    # *Amazon VPC User Guide*.
    property secondary_private_ip_address_count : Int32 | Nil

    def initialize(
      @availability_mode : AvailabilityMode | Nil = nil,
      @allocation_id : String | Nil = nil,
      @client_token : String | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @subnet_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @availability_zone_addresses : Array(AvailabilityZoneAddress) | Nil = nil,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @connectivity_type : ConnectivityType | Nil = nil,
      @private_ip_address : String | Nil = nil,
      @secondary_allocation_ids : Array(String) | Nil = nil,
      @secondary_private_ip_addresses : Array(String) | Nil = nil,
      @secondary_private_ip_address_count : Int32 | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_mode
        params << {"#{prefix}AvailabilityMode", value.to_json_object_key}
      end

      if value = @allocation_id
        params << {"#{prefix}AllocationId", value}
      end

      if value = @client_token
        params << {"#{prefix}ClientToken", value}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      (@availability_zone_addresses || [] of AvailabilityZoneAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AvailabilityZoneAddress.#{i}."))
      end

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @connectivity_type
        params << {"#{prefix}ConnectivityType", value.to_json_object_key}
      end

      if value = @private_ip_address
        params << {"#{prefix}PrivateIpAddress", value}
      end

      (@secondary_allocation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecondaryAllocationId.#{i}", item}
      end

      (@secondary_private_ip_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}SecondaryPrivateIpAddress.#{i}", item}
      end

      if value = @secondary_private_ip_address_count
        params << {"#{prefix}SecondaryPrivateIpAddressCount", value.to_s}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_mode: (n = node.xpath_node("*[local-name()='AvailabilityMode']")) ? AEC::AvailabilityMode.from_json_object_key?(n.content) : nil,
        allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AllocationId']")),
        client_token: Core::XMLValue.string(node.xpath_node("*[local-name()='ClientToken']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='SubnetId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")),
        availability_zone_addresses: node.xpath_nodes("*[local-name()='AvailabilityZoneAddress']/*[local-name()='AvailabilityZoneAddress']").map { |n| AvailabilityZoneAddress.from_xml(n) },
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        connectivity_type: (n = node.xpath_node("*[local-name()='ConnectivityType']")) ? AEC::ConnectivityType.from_json_object_key?(n.content) : nil,
        private_ip_address: Core::XMLValue.string(node.xpath_node("*[local-name()='PrivateIpAddress']")),
        secondary_allocation_ids: node.xpath_nodes("*[local-name()='SecondaryAllocationId']/*[local-name()='AllocationId']").map { |n| n.content },
        secondary_private_ip_addresses: node.xpath_nodes("*[local-name()='SecondaryPrivateIpAddress']/*[local-name()='item']").map { |n| n.content },
        secondary_private_ip_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='SecondaryPrivateIpAddressCount']")),
      )
    end

    def validate! : Nil
      if value = @availability_zone_addresses
        value.each(&.validate!)
      end

      if value = @tag_specifications
        value.each(&.validate!)
      end

      if value = @secondary_private_ip_address_count
        raise Core::ValidationError.new("SecondaryPrivateIpAddressCount value must be >= 1") if value < 1
        raise Core::ValidationError.new("SecondaryPrivateIpAddressCount value must be <= 31") if value > 31
      end
    end

    def_equals_and_hash(@availability_mode, @allocation_id, @client_token, @dry_run, @subnet_id, @vpc_id, @availability_zone_addresses, @tag_specifications, @connectivity_type, @private_ip_address, @secondary_allocation_ids, @secondary_private_ip_addresses, @secondary_private_ip_address_count)
  end
end
