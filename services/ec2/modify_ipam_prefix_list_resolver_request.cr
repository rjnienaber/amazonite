private alias Core = Amazonite::Core

module Amazonite::EC2
  class ModifyIpamPrefixListResolverRequest
    # A check for whether you have the required permissions for the action without actually making the
    # request and provides an error response. If you have the required permissions, the error response
    # is `DryRunOperation`. Otherwise, it is `UnauthorizedOperation`.
    property dry_run : Bool | Nil

    # The ID of the IPAM prefix list resolver to modify.
    property ipam_prefix_list_resolver_id : String

    # A new description for the IPAM prefix list resolver.
    property description : String | Nil

    # The updated CIDR selection rules for the resolver. These rules replace the existing rules
    # entirely.
    property rules : Array(IpamPrefixListResolverRuleRequest) | Nil

    def initialize(
      @ipam_prefix_list_resolver_id : String,
      @dry_run : Bool | Nil = nil,
      @description : String | Nil = nil,
      @rules : Array(IpamPrefixListResolverRuleRequest) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @dry_run
        params << {"#{prefix}DryRun", Core::QueryValue.bool(value)}
      end

      params << {"#{prefix}IpamPrefixListResolverId", @ipam_prefix_list_resolver_id}

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@rules || [] of IpamPrefixListResolverRuleRequest).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Rule.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        dry_run: Core::XMLValue.bool(node.xpath_node("*[local-name()='DryRun']")),
        ipam_prefix_list_resolver_id: Core::XMLValue.string(node.xpath_node("*[local-name()='IpamPrefixListResolverId']")).not_nil!,
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='Description']")),
        rules: node.xpath_nodes("*[local-name()='Rule']/*[local-name()='Rule']").map { |n| IpamPrefixListResolverRuleRequest.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @rules
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@dry_run, @ipam_prefix_list_resolver_id, @description, @rules)
  end
end
