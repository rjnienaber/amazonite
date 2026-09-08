private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM to delete.
    property ipam_id : String

    # Enables you to quickly delete an IPAM, private scopes, pools in private scopes, and any
    # allocations in the pools in private scopes. You cannot delete the IPAM with this option if there
    # is a pool in your public scope. If you use this option, IPAM does the following:
    #
    # - Deallocates any CIDRs allocated to VPC resources (such as VPCs) in pools in private scopes.
    #
    # No VPC resources are deleted as a result of enabling this option. The CIDR associated with the
    # resource will no longer be allocated from an IPAM pool, but the CIDR itself will remain
    # unchanged.
    #
    # - Deprovisions all IPv4 CIDRs provisioned to IPAM pools in private scopes.
    #
    # - Deletes all IPAM pools in private scopes.
    #
    # - Deletes all non-default private scopes in the IPAM.
    #
    # - Deletes the default public and private scopes and the IPAM.
    property cascade : Bool | Nil

    def initialize(
      @ipam_id : String,
      @dry_run : Bool | Nil = nil,
      @cascade : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamId", @ipam_id}

      if value = @cascade
        params << {"#{prefix}Cascade", Core::QueryValue.bool(value)}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamId']")).not_nil!,
        cascade: Core::XMLValue.bool(node.xpath_node("*[local-name()='Cascade']")),
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_id, @cascade)
  end
end
