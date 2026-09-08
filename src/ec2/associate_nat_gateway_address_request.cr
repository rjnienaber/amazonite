private alias Core = Amazonite::Core

module Amazonite::EC2
  class AssociateNatGatewayAddressRequest
    # The ID of the NAT gateway.
    property nat_gateway_id : String

    # The allocation IDs of EIPs that you want to associate with your NAT gateway.
    property allocation_ids : Array(String) = [] of String

    # The private IPv4 addresses that you want to assign to the NAT gateway.
    property private_ip_addresses : Array(String) | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # For regional NAT gateways only: The Availability Zone where you want to associate an Elastic IP
    # address (EIP). The regional NAT gateway uses a separate EIP in each AZ to handle outbound NAT
    # traffic from that AZ.
    #
    # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
    # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
    # Region.
    property availability_zone : String | Nil

    # For regional NAT gateways only: The ID of the Availability Zone where you want to associate an
    # Elastic IP address (EIP). The regional NAT gateway uses a separate EIP in each AZ to handle
    # outbound NAT traffic from that AZ. Use this instead of AvailabilityZone for consistent
    # identification of AZs across Amazon Web Services Regions.
    #
    # A regional NAT gateway is a single NAT Gateway that works across multiple availability zones
    # (AZs) in your VPC, providing redundancy, scalability and availability across all the AZs in a
    # Region.
    property availability_zone_id : String | Nil

    def initialize(
      @nat_gateway_id : String,
      @allocation_ids : Array(String),
      @private_ip_addresses : Array(String) | Nil = nil,
      @dry_run : Bool | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      params << {"#{prefix}NatGatewayId", @nat_gateway_id}

      @allocation_ids.each_with_index(1) do |item, i|
        params << {"#{prefix}AllocationId.#{i}", item}
      end

      (@private_ip_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PrivateIpAddress.#{i}", item}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        nat_gateway_id: Core::XMLValue.string(node.xpath_node("*[local-name()='NatGatewayId']")).not_nil!,
        allocation_ids: node.xpath_nodes("*[local-name()='AllocationId']/*[local-name()='AllocationId']").map { |n| n.content },
        private_ip_addresses: node.xpath_nodes("*[local-name()='PrivateIpAddress']/*[local-name()='item']").map { |n| n.content },
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@nat_gateway_id, @allocation_ids, @private_ip_addresses, @dry_run, @availability_zone, @availability_zone_id)
  end
end
