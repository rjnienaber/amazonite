private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpv6PoolsResult
    # Information about the IPv6 address pools.
    property ipv_6_pools : Array(Ipv6Pool) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @ipv_6_pools : Array(Ipv6Pool) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipv_6_pools || [] of Ipv6Pool).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}Ipv6PoolSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipv_6_pools: node.xpath_nodes("*[local-name()='ipv6PoolSet']/*[local-name()='item']").map { |n| Ipv6Pool.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipv_6_pools
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipv_6_pools, @next_token)
  end
end
