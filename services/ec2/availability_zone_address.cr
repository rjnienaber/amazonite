private alias Core = Amazonite::Core

module Amazonite::EC2
  # For regional NAT gateways only: The configuration specifying which Elastic IP address (EIP) to
  # use for handling outbound NAT traffic from a specific Availability Zone.
  #
  # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
  # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
  # Region.
  #
  # For more information, see [Regional NAT gateways for automatic multi-AZ
  # expansion](https://docs.aws.amazon.com/vpc/latest/userguide/nat-gateways-regional.html) in the
  # *Amazon VPC User Guide*.
  class AvailabilityZoneAddress
    # For regional NAT gateways only: The Availability Zone where this specific NAT gateway
    # configuration will be active. Each AZ in a regional NAT gateway has its own configuration to
    # handle outbound NAT traffic from that AZ.
    #
    # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
    # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
    # Region.
    property availability_zone : String | Nil

    # For regional NAT gateways only: The ID of the Availability Zone where this specific NAT gateway
    # configuration will be active. Each AZ in a regional NAT gateway has its own configuration to
    # handle outbound NAT traffic from that AZ. Use this instead of AvailabilityZone for consistent
    # identification of AZs across Amazon Web Services Regions.
    #
    # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
    # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
    # Region.
    property availability_zone_id : String | Nil

    # The allocation IDs of the Elastic IP addresses (EIPs) to be used for handling outbound NAT
    # traffic in this specific Availability Zone.
    property allocation_ids : Array(String) | Nil

    def initialize(
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @allocation_ids : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      (@allocation_ids || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}AllocationId.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        allocation_ids: node.xpath_nodes("*[local-name()='AllocationId']/*[local-name()='AllocationId']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@availability_zone, @availability_zone_id, @allocation_ids)
  end
end
