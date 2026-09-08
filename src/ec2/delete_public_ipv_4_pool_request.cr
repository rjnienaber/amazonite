private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeletePublicIpv4PoolRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the public IPv4 pool you want to delete.
    property pool_id : String

    # The Availability Zone (AZ) or Local Zone (LZ) network border group that the resource that the IP
    # address is assigned to is in. Defaults to an AZ network border group. For more information on
    # available Local Zones, see [Local Zone
    # availability](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-byoip.html#byoip-zone-avail)
    # in the *Amazon EC2 User Guide*.
    property network_border_group : String | Nil

    def initialize(
      @pool_id : String,
      @dry_run : Bool | Nil = nil,
      @network_border_group : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}PoolId", @pool_id}

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PoolId']")).not_nil!,
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='NetworkBorderGroup']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @pool_id, @network_border_group)
  end
end
