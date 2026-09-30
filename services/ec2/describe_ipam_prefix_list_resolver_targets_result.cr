private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamPrefixListResolverTargetsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the IPAM prefix list resolver Targets.
    property ipam_prefix_list_resolver_targets : Array(IpamPrefixListResolverTarget) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_prefix_list_resolver_targets : Array(IpamPrefixListResolverTarget) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_prefix_list_resolver_targets || [] of IpamPrefixListResolverTarget).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPrefixListResolverTargetSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_prefix_list_resolver_targets: node.xpath_nodes("*[local-name()='ipamPrefixListResolverTargetSet']/*[local-name()='item']").map { |n| IpamPrefixListResolverTarget.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_prefix_list_resolver_targets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_prefix_list_resolver_targets)
  end
end
