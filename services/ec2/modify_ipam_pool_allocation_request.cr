private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamPoolAllocationRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM pool allocation you want to modify.
    property ipam_pool_allocation_id : String

    # The new description for the IPAM pool allocation. If you submit a `null` value, the description
    # is removed from the allocation.
    property description : String | Nil

    def initialize(
      @ipam_pool_allocation_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolAllocationId", @ipam_pool_allocation_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_allocation_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolAllocationId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_pool_allocation_id, @description)
  end
end
