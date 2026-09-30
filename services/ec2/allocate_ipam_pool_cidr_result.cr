private alias Core = Amazonite::Core

module Amazonite::EC2
  class AllocateIpamPoolCidrResult
    # Information about the allocation created.
    property ipam_pool_allocation : IpamPoolAllocation | Nil

    def initialize(
      @ipam_pool_allocation : IpamPoolAllocation | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @ipam_pool_allocation
        params.concat(value.to_query_params("#{prefix}IpamPoolAllocation."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        ipam_pool_allocation: node.xpath_node("*[local-name()='ipamPoolAllocation']").try { |n| IpamPoolAllocation.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @ipam_pool_allocation
        value.validate!
      end
    end

    def_equals_and_hash(@ipam_pool_allocation)
  end
end
