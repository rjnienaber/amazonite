private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPoolAllocationsResult
    # The IPAM pool allocations you want information on.
    property ipam_pool_allocations : Array(IpamPoolAllocation) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @ipam_pool_allocations : Array(IpamPoolAllocation) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_pool_allocations || [] of IpamPoolAllocation).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPoolAllocationSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_pool_allocations: node.xpath_nodes("*[local-name()='ipamPoolAllocationSet']/*[local-name()='item']").map { |n| IpamPoolAllocation.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_pool_allocations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_pool_allocations, @next_token)
  end
end
