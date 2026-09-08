private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeprovisionPublicIpv4PoolCidrRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the pool that you want to deprovision the CIDR from.
    property pool_id : String

    # The CIDR you want to deprovision from the pool.
    property cidr : String

    def initialize(
      @pool_id : String,
      @cidr : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}PoolId", @pool_id}

      params << {"#{prefix}Cidr", @cidr}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='PoolId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @pool_id, @cidr)
  end
end
