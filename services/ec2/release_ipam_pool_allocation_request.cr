private alias Core = Amazonite::Core

module Amazonite::EC2
  class ReleaseIpamPoolAllocationRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM pool which contains the allocation you want to release.
    property ipam_pool_id : String

    # The CIDR of the allocation you want to release.
    property cidr : String

    # The ID of the allocation.
    property ipam_pool_allocation_id : String

    def initialize(
      @ipam_pool_id : String,
      @cidr : String,
      @ipam_pool_allocation_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      params << {"#{prefix}Cidr", @cidr}

      params << {"#{prefix}IpamPoolAllocationId", @ipam_pool_allocation_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        cidr: Core::XMLValue.string(node.xpath_node("*[local-name()='Cidr']")).not_nil!,
        ipam_pool_allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolAllocationId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_pool_id, @cidr, @ipam_pool_allocation_id)
  end
end
