private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamPoolRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the pool to delete.
    property ipam_pool_id : String

    # Enables you to quickly delete an IPAM pool and all resources within that pool, including
    # provisioned CIDRs, allocations, and other pools.
    #
    # You can only use this option to delete pools in the private scope or pools in the public scope
    # with a source resource. A source resource is a resource used to provision CIDRs to a resource
    # planning pool.
    property cascade : Bool | Nil

    def initialize(
      @ipam_pool_id : String,
      @dry_run : Bool | Nil = nil,
      @cascade : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPoolId", @ipam_pool_id}

      if value = @cascade
        params << {"#{prefix}Cascade", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPoolId']")).not_nil!,
        cascade: Core::XMLValue.bool(node.xpath_node("*[local-name()='Cascade']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_pool_id, @cascade)
  end
end
