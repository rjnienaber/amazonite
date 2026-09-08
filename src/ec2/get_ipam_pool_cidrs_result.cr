private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetIpamPoolCidrsResult
    # Information about the CIDRs provisioned to an IPAM pool.
    property ipam_pool_cidrs : Array(IpamPoolCidr) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @ipam_pool_cidrs : Array(IpamPoolCidr) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@ipam_pool_cidrs || [] of IpamPoolCidr).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}IpamPoolCidrSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_pool_cidrs: node.xpath_nodes("*[local-name()='ipamPoolCidrSet']/*[local-name()='item']").map { |n| IpamPoolCidr.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @ipam_pool_cidrs
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@ipam_pool_cidrs, @next_token)
  end
end
