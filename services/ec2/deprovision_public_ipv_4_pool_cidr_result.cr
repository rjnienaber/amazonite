private alias Core = Amazonite::Core

module Amazonite::EC2
  class DeprovisionPublicIpv4PoolCidrResult
    # The ID of the pool that you deprovisioned the CIDR from.
    property pool_id : String | Nil

    # The deprovisioned CIDRs.
    property deprovisioned_addresses : Array(String) | Nil

    def initialize(
      @pool_id : String | Nil = nil,
      @deprovisioned_addresses : Array(String) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end

      (@deprovisioned_addresses || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}DeprovisionedAddressSet.#{i}", item}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        deprovisioned_addresses: node.xpath_nodes("*[local-name()='deprovisionedAddressSet']/*[local-name()='item']").map { |n| n.content },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@pool_id, @deprovisioned_addresses)
  end
end
