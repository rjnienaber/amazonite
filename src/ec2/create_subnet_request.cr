private alias Core = Amazonite::Core

module Amazonite::EC2
  class CreateSubnetRequest
    # The tags to assign to the subnet.
    property tag_specifications : Array(TagSpecification) | Nil

    # The Availability Zone or Local Zone for the subnet.
    #
    # Default: Amazon Web Services selects one for you. If you create more than one subnet in your
    # VPC, we do not necessarily select a different zone for each subnet.
    #
    # To create a subnet in a Local Zone, set this value to the Local Zone ID, for example
    # `us-west-2-lax-1a`. For information about the Regions that support Local Zones, see [Available
    # Local Zones](https://docs.aws.amazon.com/local-zones/latest/ug/available-local-zones.html).
    #
    # To create a subnet in an Outpost, set this value to the Availability Zone for the Outpost and
    # specify the Outpost ARN.
    property availability_zone : String | Nil

    # The AZ ID or the Local Zone ID of the subnet.
    property availability_zone_id : String | Nil

    # The IPv4 network range for the subnet, in CIDR notation. For example, `10.0.0.0/24`. We modify
    # the specified CIDR block to its canonical form; for example, if you specify `100.68.0.18/18`, we
    # modify it to `100.68.0.0/18`.
    #
    # This parameter is not supported for an IPv6 only subnet.
    property cidr_block : String | Nil

    # The IPv6 network range for the subnet, in CIDR notation. This parameter is required for an IPv6
    # only subnet.
    property ipv_6_cidr_block : String | Nil

    # The Amazon Resource Name (ARN) of the Outpost. If you specify an Outpost ARN, you must also
    # specify the Availability Zone of the Outpost subnet.
    property outpost_arn : String | Nil

    # The ID of the VPC.
    property vpc_id : String

    # Indicates whether to create an IPv6 only subnet.
    property ipv_6_native : Bool | Nil

    # An IPv4 IPAM pool ID for the subnet.
    property ipv_4_ipam_pool_id : String | Nil

    # An IPv4 netmask length for the subnet.
    property ipv_4_netmask_length : Int32 | Nil

    # An IPv6 IPAM pool ID for the subnet.
    property ipv_6_ipam_pool_id : String | Nil

    # An IPv6 netmask length for the subnet.
    property ipv_6_netmask_length : Int32 | Nil

    # Checks whether you have the required permissions for the action, without actually making the
    # request, and provides an error response. If you have the required permissions, the error
    # response is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    def initialize(
      @vpc_id : String,
      @tag_specifications : Array(TagSpecification) | Nil = nil,
      @availability_zone : String | Nil = nil,
      @availability_zone_id : String | Nil = nil,
      @cidr_block : String | Nil = nil,
      @ipv_6_cidr_block : String | Nil = nil,
      @outpost_arn : String | Nil = nil,
      @ipv_6_native : Bool | Nil = nil,
      @ipv_4_ipam_pool_id : String | Nil = nil,
      @ipv_4_netmask_length : Int32 | Nil = nil,
      @ipv_6_ipam_pool_id : String | Nil = nil,
      @ipv_6_netmask_length : Int32 | Nil = nil,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@tag_specifications || [] of TagSpecification).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSpecification.#{i}."))
      end

      if value = @availability_zone
        params << {"#{prefix}AvailabilityZone", value}
      end

      if value = @availability_zone_id
        params << {"#{prefix}AvailabilityZoneId", value}
      end

      if value = @cidr_block
        params << {"#{prefix}CidrBlock", value}
      end

      if value = @ipv_6_cidr_block
        params << {"#{prefix}Ipv6CidrBlock", value}
      end

      if value = @outpost_arn
        params << {"#{prefix}OutpostArn", value}
      end

      params << {"#{prefix}VpcId", @vpc_id}

      if value = @ipv_6_native
        params << {"#{prefix}Ipv6Native", Core::QueryValue.bool(value)}
      end

      if value = @ipv_4_ipam_pool_id
        params << {"#{prefix}Ipv4IpamPoolId", value}
      end

      if value = @ipv_4_netmask_length
        params << {"#{prefix}Ipv4NetmaskLength", value.to_s}
      end

      if value = @ipv_6_ipam_pool_id
        params << {"#{prefix}Ipv6IpamPoolId", value}
      end

      if value = @ipv_6_netmask_length
        params << {"#{prefix}Ipv6NetmaskLength", value.to_s}
      end

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        tag_specifications: node.xpath_nodes("*[local-name()='TagSpecification']/*[local-name()='item']").map { |n| TagSpecification.from_xml(n) },
        availability_zone: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZone']")),
        availability_zone_id: Core::XMLValue.string(node.xpath_node("*[local-name()='AvailabilityZoneId']")),
        cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='CidrBlock']")),
        ipv_6_cidr_block: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6CidrBlock']")),
        outpost_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='OutpostArn']")),
        vpc_id: Core::XMLValue.string(node.xpath_node("*[local-name()='VpcId']")).not_nil!,
        ipv_6_native: Core::XMLValue.bool(node.xpath_node("*[local-name()='Ipv6Native']")),
        ipv_4_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv4IpamPoolId']")),
        ipv_4_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv4NetmaskLength']")),
        ipv_6_ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='Ipv6IpamPoolId']")),
        ipv_6_netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='Ipv6NetmaskLength']")),
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='dryRun']")),
      )
    end

    def validate! : Nil
      if value = @tag_specifications
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@tag_specifications, @availability_zone, @availability_zone_id, @cidr_block, @ipv_6_cidr_block, @outpost_arn, @vpc_id, @ipv_6_native, @ipv_4_ipam_pool_id, @ipv_4_netmask_length, @ipv_6_ipam_pool_id, @ipv_6_netmask_length, @dry_run)
  end
end
