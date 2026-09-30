private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeIpamPoolsResult
    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    # Information about the IPAM pools.
    property ipam_pools : Array(IpamPool) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @ipam_pools : Array(IpamPool) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@ipam_pools || [] of IpamPool).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPoolSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        ipam_pools: node.xpath_nodes("*[local-name()='ipamPoolSet']/*[local-name()='item']").map { |n| IpamPool.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_pools
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @ipam_pools)
  end
end
