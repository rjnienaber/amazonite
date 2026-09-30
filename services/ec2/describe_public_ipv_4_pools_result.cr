private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribePublicIpv4PoolsResult
    # Information about the address pools.
    property public_ipv_4_pools : Array(PublicIpv4Pool) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @public_ipv_4_pools : Array(PublicIpv4Pool) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@public_ipv_4_pools || [] of PublicIpv4Pool).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PublicIpv4PoolSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        public_ipv_4_pools: node.xpath_nodes("*[local-name()='publicIpv4PoolSet']/*[local-name()='item']").map { |n| PublicIpv4Pool.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @public_ipv_4_pools
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@public_ipv_4_pools, @next_token)
  end
end
