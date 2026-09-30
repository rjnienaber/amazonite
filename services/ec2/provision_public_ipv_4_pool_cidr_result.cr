private alias Core = Amazonite::Core

module Amazonite::EC2
  class ProvisionPublicIpv4PoolCidrResult
    # The ID of the pool that you want to provision the CIDR to.
    property pool_id : String | Nil

    # Information about the address range of the public IPv4 pool.
    property pool_address_range : PublicIpv4PoolRange | Nil

    def initialize(
      @pool_id : String | Nil = nil,
      @pool_address_range : PublicIpv4PoolRange | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end

      if value = @pool_address_range
        params.concat(value.to_query_params("#{prefix}PoolAddressRange."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        pool_address_range: node.xpath_node("*[local-name()='poolAddressRange']").try { |n| PublicIpv4PoolRange.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @pool_address_range
        value.validate!
      end
    end

    def_equals_and_hash(@pool_id, @pool_address_range)
  end
end
