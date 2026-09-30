private alias Core = Amazonite::Core

module Amazonite::EC2
  class ProvisionPublicIpv4PoolCidrRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM pool you would like to use to allocate this CIDR.
    property ipam_pool_id : String

    # The ID of the public IPv4 pool you would like to use for this CIDR.
    property pool_id : String

    # The netmask length of the CIDR you would like to allocate to the public IPv4 pool. The least
    # specific netmask length you can define is 24.
    property netmask_length : Int32

    # The Availability Zone (AZ) or Local Zone (LZ) network border group that the resource that the IP
    # address is assigned to is in. Defaults to an AZ network border group. For more information on
    # available Local Zones, see [Local Zone
    # availability](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#byoip-zone-avail)
    # in the *Amazon EC2 User Guide*.
    property network_border_group : String | Nil

    def initialize(
      @ipam_pool_id : String,
      @pool_id : String,
      @netmask_length : Int32,
      @dry_run : Bool | Nil = nil,
      @network_border_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      params << {"#{prefix}PoolId", @pool_id}

      params << {"#{prefix}NetmaskLength", @netmask_length.to_s}

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PoolId']")).not_nil!,
        netmask_length: Core::XMLValue.i32(node.xpath_node("*[local-name()='NetmaskLength']")).not_nil!,
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_pool_id, @pool_id, @netmask_length, @network_border_group)
  end
end
