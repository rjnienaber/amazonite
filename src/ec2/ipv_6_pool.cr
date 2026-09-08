private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv6 address pool.
  class Ipv6Pool
    # The ID of the address pool.
    property pool_id : String | Nil

    # The description for the address pool.
    property description : String | Nil

    # The CIDR blocks for the address pool.
    property pool_cidr_blocks : Array(PoolCidrBlock) | Nil

    # Any tags for the address pool.
    property tags : Array(Tag) | Nil

    def initialize(
      @pool_id : String | Nil = nil,
      @description : String | Nil = nil,
      @pool_cidr_blocks : Array(PoolCidrBlock) | Nil = nil,
      @tags : Array(Tag) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @pool_id
        params << {"#{prefix}PoolId", value}
      end

      if value = @description
        params << {"#{prefix}Description", value}
      end

      (@pool_cidr_blocks || [] of PoolCidrBlock).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PoolCidrBlockSet.#{i}."))
      end

      (@tags || [] of Tag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}TagSet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        pool_id: Core::XMLValue.string(node.xpath_node("*[local-name()='poolId']")),
        description: Core::XMLValue.string(node.xpath_node("*[local-name()='description']")),
        pool_cidr_blocks: node.xpath_nodes("*[local-name()='poolCidrBlockSet']/*[local-name()='item']").map { |n| PoolCidrBlock.from_xml(n) },
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @pool_cidr_blocks
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@pool_id, @description, @pool_cidr_blocks, @tags)
  end
end
