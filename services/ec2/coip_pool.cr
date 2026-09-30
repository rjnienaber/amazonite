private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes a customer-owned address pool.
  class CoipPool
    # The ID of the address pool.
    property pool_id : String | Nil

    # The address ranges of the address pool.
    property pool_cidrs : Array(String) | Nil

    # The ID of the local gateway route table.
    property local_gateway_route_table_id : String | Nil

    # The tags.
    property tags : Array(Tag) | Nil

    # The ARN of the address pool.
    property pool_arn : String | Nil

    def initialize(
      @pool_id : String | Nil = nil,
      @pool_cidrs : Array(String) | Nil = nil,
      @local_gateway_route_table_id : String | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
      @pool_arn : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end

      (@pool_cidrs || [] of String).each_with_index(1) do |item, i|
        params << {"#{prefix}PoolCidrSet.#{i}", item}
      end

      if value = @local_gateway_route_table_id
        params << {"#{prefix}LocalGatewayRouteTableId", value}
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end

      if value = @pool_arn
        params << {"#{prefix}PoolArn", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        pool_cidrs: node.xpath_nodes("*[local-name()='poolCidrSet']/*[local-name()='item']").map { |n| n.content },
        local_gateway_route_table_id: Core::XMLValue.string(node.xpath_node("*[local-name()='localGatewayRouteTableId']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
        pool_arn: Core::XMLValue.string(node.xpath_node("*[local-name()='poolArn']")),
      )
    end

    def validate! : Nil
      if value = @tags
        value.each(&.validate!)
      end

      if value = @pool_arn
        raise Core::ValidationError.new("PoolArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("PoolArn length must be <= 1283") if value.size > 1283
      end
    end

    def_equals_and_hash(@pool_id, @pool_cidrs, @local_gateway_route_table_id, @tags, @pool_arn)
  end
end
