private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCoipPoolUsageResult
    # The ID of the customer-owned address pool.
    property coip_pool_id : String | Nil

    # Information about the address usage.
    property coip_address_usages : Array(CoipAddressUsage) | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @coip_pool_id : String | Nil = nil,
      @coip_address_usages : Array(CoipAddressUsage) | Nil = nil,
      @local_gateway_route_table_id : String | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @coip_pool_id
        params << {"#{prefix}CoipPoolId", value}
      end

      (@coip_address_usages || [] of CoipAddressUsage).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}CoipAddressUsageSet.#{i}."))
      end

      if value = @local_gateway_route_table_id
        params << {"#{prefix}LocalGatewayRouteTableId", value}
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        coip_pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='coipPoolId']")),
        coip_address_usages: node.xpath_nodes("*[local-name()='coipAddressUsageSet']/*[local-name()='item']").map { |n| CoipAddressUsage.from_xml(n) },
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableId']")),
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @coip_address_usages
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@coip_pool_id, @coip_address_usages, @local_gateway_route_table_id, @next_token)
  end
end
