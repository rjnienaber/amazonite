private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamPrefixListResolversResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the IPAM prefix list resolvers.
    property ipam_prefix_list_resolvers : Array(IpamPrefixListResolver) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_prefix_list_resolvers : Array(IpamPrefixListResolver) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_prefix_list_resolvers || [] of IpamPrefixListResolver).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPrefixListResolverSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_prefix_list_resolvers: node.xpath_nodes("*[local-name()='ipamPrefixListResolverSet']/*[local-name()='item']").map { |n| IpamPrefixListResolver.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_prefix_list_resolvers
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_prefix_list_resolvers)
  end
end
