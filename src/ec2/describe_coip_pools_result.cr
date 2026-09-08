private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeCoipPoolsResult
    # Information about the address pools.
    property coip_pools : Array(CoipPool) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @coip_pools : Array(CoipPool) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@coip_pools || [] of CoipPool).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CoipPoolSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        coip_pools: node.xpath_nodes("*[local-name()='coipPoolSet']/*[local-name()='item']").map { |n| CoipPool.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @coip_pools
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@coip_pools, @next_token)
  end
end
