private alias Core = Amazonite::Core

module Amazonite::EC2
  class MoveByoipCidrToIpamRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The BYOIP CIDR.
    property cidr : String

    # The IPAM pool ID.
    property ipam_pool_id : String

    # The Amazon Web Services account ID of the owner of the IPAM pool.
    property ipam_pool_owner : String

    def initialize(
      @cidr : String,
      @ipam_pool_id : String,
      @ipam_pool_owner : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}Cidr", @cidr}

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      params << {"#{prefix}IpamPoolOwner", @ipam_pool_owner}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        ipam_pool_owner: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolOwner']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @cidr, @ipam_pool_id, @ipam_pool_owner)
  end
end
