private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeleteIpamPrefixListResolverTargetRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM prefix list resolver target to delete.
    property ipam_prefix_list_resolver_target_id : String

    def initialize(
      @ipam_prefix_list_resolver_target_id : String,
      @dry_run : Bool | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPrefixListResolverTargetId", @ipam_prefix_list_resolver_target_id}
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_prefix_list_resolver_target_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPrefixListResolverTargetId']")).not_nil!,
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@dry_run, @ipam_prefix_list_resolver_target_id)
  end
end
