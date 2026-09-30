private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes an IPv4 address pool.
  class PublicIpv4Pool
    # The ID of the address pool.
    property pool_id : String | Nil

    # A description of the address pool.
    property description : String | Nil

    # The address ranges.
    property pool_address_ranges : Array(PublicIpv4PoolRange) | Nil

    # The total number of addresses.
    property total_address_count : Int32 | Nil

    # The total number of available addresses.
    property total_available_address_count : Int32 | Nil

    # The name of the location from which the address pool is advertised. A network border group is a
    # unique set of Availability Zones or Local Zones from where Amazon Web Services advertises public
    # IP addresses.
    property network_border_group : String | Nil

    # Any tags for the address pool.
    property tags : Array(Tag) | Nil

    def initialize(
      @pool_id : String | Nil = nil,
      @description : String | Nil = nil,
      @pool_address_ranges : Array(PublicIpv4PoolRange) | Nil = nil,
      @total_address_count : Int32 | Nil = nil,
      @total_available_address_count : Int32 | Nil = nil,
      @network_border_group : String | Nil = nil,
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

      (@pool_address_ranges || [] of PublicIpv4PoolRange).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}PoolAddressRangeSet.#{i}."))
      end

      if value = @total_address_count
        params << {"#{prefix}TotalAddressCount", value.to_s}
      end

      if value = @total_available_address_count
        params << {"#{prefix}TotalAvailableAddressCount", value.to_s}
      end

      if value = @network_border_group
        params << {"#{prefix}NetworkBorderGroup", value}
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
        pool_address_ranges: node.xpath_nodes("*[local-name()='poolAddressRangeSet']/*[local-name()='item']").map { |n| PublicIpv4PoolRange.from_xml(n) },
        total_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalAddressCount']")),
        total_available_address_count: Core::XMLValue.i32(node.xpath_node("*[local-name()='totalAvailableAddressCount']")),
        network_border_group: Core::XMLValue.string(node.xpath_node("*[local-name()='networkBorderGroup']")),
        tags: node.xpath_nodes("*[local-name()='tagSet']/*[local-name()='item']").map { |n| Tag.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @pool_address_ranges
        value.each(&.validate!)
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@pool_id, @description, @pool_address_ranges, @total_address_count, @total_available_address_count, @network_border_group, @tags)
  end
end
