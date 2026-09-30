private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a NAT gateway.
  class NatGateway
    # The date and time the NAT gateway was created.
    property create_time : Time | Nil

    # The date and time the NAT gateway was deleted, if applicable.
    property delete_time : Time | Nil

    # If the NAT gateway could not be created, specifies the error code for the failure.
    # (`InsufficientFreeAddressesInSubnet` | `Gateway.NotAttached` | `InvalidAllocationID.NotFound` |
    # `Resource.AlreadyAssociated` | `InternalError` | `InvalidSubnetID.NotFound`)
    property failure_code : String | Nil

    # If the NAT gateway could not be created, specifies the error message for the failure, that
    # corresponds to the error code.
    #
    # - For InsufficientFreeAddressesInSubnet: "Subnet has insufficient free addresses to create this
    # NAT gateway"
    #
    # - For Gateway.NotAttached: "Network vpc-xxxxxxxx has no Internet gateway attached"
    #
    # - For InvalidAllocationID.NotFound: "Elastic IP address eipalloc-xxxxxxxx could not be
    # associated with this NAT gateway"
    #
    # - For Resource.AlreadyAssociated: "Elastic IP address eipalloc-xxxxxxxx is already associated"
    #
    # - For InternalError: "Network interface eni-xxxxxxxx, created and used internally by this NAT
    # gateway is in an invalid state. Please try again."
    #
    # - For InvalidSubnetID.NotFound: "The specified subnet subnet-xxxxxxxx does not exist or could
    # not be found."
    property failure_message : String | Nil

    # Information about the IP addresses and network interface associated with the NAT gateway.
    property nat_gateway_addresses : Array(NatGatewayAddress) | Nil

    # The ID of the NAT gateway.
    property nat_gateway_id : String | Nil

    # Reserved. If you need to sustain traffic greater than the [documented
    # limits](https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-gateways),
    # contact Amazon Web Services Support.
    property provisioned_bandwidth : ProvisionedBandwidth | Nil

    # The state of the NAT gateway.
    #
    # - `pending`: The NAT gateway is being created and is not ready to process traffic.
    #
    # - `failed`: The NAT gateway could not be created. Check the `failureCode` and `failureMessage`
    # fields for the reason.
    #
    # - `available`: The NAT gateway is able to process traffic. This status remains until you delete
    # the NAT gateway, and does not indicate the health of the NAT gateway.
    #
    # - `deleting`: The NAT gateway is in the process of being terminated and may still be processing
    # traffic.
    #
    # - `deleted`: The NAT gateway has been terminated and is no longer processing traffic.
    property state : NatGatewayState | Nil

    # The ID of the subnet in which the NAT gateway is located.
    property subnet_id : String | Nil

    # The ID of the VPC in which the NAT gateway is located.
    property vpc_id : String | Nil

    # The tags for the NAT gateway.
    property tags : Array(Tag) | Nil

    # Indicates whether the NAT gateway supports public or private connectivity.
    property connectivity_type : ConnectivityType | Nil

    # Indicates whether this is a zonal (single-AZ) or regional (multi-AZ) NAT gateway.
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

    # For regional NAT gateways only: Indicates whether Amazon Web Services automatically allocates
    # additional Elastic IP addresses (EIPs) in an AZ when the NAT gateway needs more ports due to
    # increased concurrent connections to a single destination from that AZ.
    #
    # For more information, see [Regional NAT gateways for automatic multi-AZ
    # expansion](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateways-regional.html) in the
    # *Amazon VPC User Guide*.
    property auto_scaling_ips : AutoScalingIpsState | Nil

    # For regional NAT gateways only: Indicates whether Amazon Web Services automatically manages AZ
    # coverage. When enabled, the NAT gateway associates EIPs in all AZs where your VPC has subnets to
    # handle outbound NAT traffic, expands to new AZs when you create subnets there, and retracts from
    # AZs where you've removed all subnets. When disabled, you must manually manage which AZs the NAT
    # gateway supports and their corresponding EIPs.
    #
    # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
    # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
    # Region.
    #
    # For more information, see [Regional NAT gateways for automatic multi-AZ
    # expansion](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateways-regional.html) in the
    # *Amazon VPC User Guide*.
    property auto_provision_zones : AutoProvisionZonesState | Nil

    # The proxy appliances attached to the NAT Gateway for filtering and inspecting traffic to prevent
    # data exfiltration.
    property attached_appliances : Array(NatGatewayAttachedAppliance) | Nil

    # For regional NAT gateways only, this is the ID of the NAT gateway.
    property route_table_id : String | Nil

    def initialize(
      @create_time : Time | Nil = nil,
      @delete_time : Time | Nil = nil,
      @failure_code : String | Nil = nil,
      @failure_message : String | Nil = nil,
      @nat_gateway_addresses : Array(NatGatewayAddress) | Nil = nil,
      @nat_gateway_id : String | Nil = nil,
      @provisioned_bandwidth : ProvisionedBandwidth | Nil = nil,
      @state : NatGatewayState | Nil = nil,
      @subnet_id : String | Nil = nil,
      @vpc_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @connectivity_type : ConnectivityType | Nil = nil,
      @availability_mode : AvailabilityMode | Nil = nil,
      @auto_scaling_ips : AutoScalingIpsState | Nil = nil,
      @auto_provision_zones : AutoProvisionZonesState | Nil = nil,
      @attached_appliances : Array(NatGatewayAttachedAppliance) | Nil = nil,
      @route_table_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @create_time
        params << {"#{prefix}CreateTime", Core::QueryValue.time(value)}
      end

      if value = @delete_time
        params << {"#{prefix}DeleteTime", Core::QueryValue.time(value)}
      end

      if value = @failure_code
        params << {"#{prefix}FailureCode", value}
      end

      if value = @failure_message
        params << {"#{prefix}FailureMessage", value}
      end

      (@nat_gateway_addresses || [] of NatGatewayAddress).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}NatGatewayAddressSet.#{i}."))
      end

      if value = @nat_gateway_id
        params << {"#{prefix}NatGatewayId", value}
      end

      if value = @provisioned_bandwidth
        params.concat(value.to_query_params("#{prefix}ProvisionedBandwidth."))
      end

      if value = @state
        params << {"#{prefix}State", value.to_json_object_key}
      end

      if value = @subnet_id
        params << {"#{prefix}SubnetId", value}
      end

      if value = @vpc_id
        params << {"#{prefix}VpcId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @connectivity_type
        params << {"#{prefix}ConnectivityType", value.to_json_object_key}
      end

      if value = @availability_mode
        params << {"#{prefix}AvailabilityMode", value.to_json_object_key}
      end

      if value = @auto_scaling_ips
        params << {"#{prefix}AutoScalingIps", value.to_json_object_key}
      end

      if value = @auto_provision_zones
        params << {"#{prefix}AutoProvisionZones", value.to_json_object_key}
      end

      (@attached_appliances || [] of NatGatewayAttachedAppliance).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}AttachedApplianceSet.#{i}."))
      end

      if value = @route_table_id
        params << {"#{prefix}RouteTableId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        create_time: Core::XMLValue.time(node.xpath_node("*[local-name()='createTime']")),
        delete_time: Core::XMLValue.time(node.xpath_node("*[local-name()='deleteTime']")),
        failure_code: Core::XMLValue.string(node.xpath_node("*[local-name()='failureCode']")),
        failure_message: Core::XMLValue.string(node.xpath_node("*[local-name()='failureMessage']")),
        nat_gateway_addresses: node.xpath_nodes("*[local-name()='natGatewayAddressSet']/*[local-name()='item']").map { |n| NatGatewayAddress.from_xml(n) },
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='natGatewayId']")),
        provisioned_bandwidth: node.xpath_node("*[local-name()='provisionedBandwidth']").try { |n| ProvisionedBandwidth.from_xml(n) },
        state: (n = node.xpath_node("*[local-name()='state']")) ? AEC::NatGatewayState.from_json_object_key?(n.content) : nil,
        subnet_id: Core::XMLValue.string(node.xpath_node("*[local-name()='subnetId']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='vpcId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        connectivity_type: (n = node.xpath_node("*[local-name()='connectivityType']")) ? AEC::ConnectivityType.from_json_object_key?(n.content) : nil,
        availability_mode: (n = node.xpath_node("*[local-name()='availabilityMode']")) ? AEC::AvailabilityMode.from_json_object_key?(n.content) : nil,
        auto_scaling_ips: (n = node.xpath_node("*[local-name()='autoScalingIps']")) ? AEC::AutoScalingIpsState.from_json_object_key?(n.content) : nil,
        auto_provision_zones: (n = node.xpath_node("*[local-name()='autoProvisionZones']")) ? AEC::AutoProvisionZonesState.from_json_object_key?(n.content) : nil,
        attached_appliances: node.xpath_nodes("*[local-name()='attachedApplianceSet']/*[local-name()='item']").map { |n| NatGatewayAttachedAppliance.from_xml(n) },
        route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='routeTableId']")),
      )
    end

    def validate! : Nil
      if value = @nat_gateway_addresses
        value.each(&.validate!)
      end

      if value = @provisioned_bandwidth
        value.validate!
      end

      if value = @tags
        value.each(&.validate!)
      end

      if value = @attached_appliances
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@create_time, @delete_time, @failure_code, @failure_message, @nat_gateway_addresses, @nat_gateway_id, @provisioned_bandwidth, @state, @subnet_id, @vpc_id, @tags, @connectivity_type, @availability_mode, @auto_scaling_ips, @auto_provision_zones, @attached_appliances, @route_table_id)
  end
end
