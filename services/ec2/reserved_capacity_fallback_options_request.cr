private alias AEC = Amazonite::EC2
private alias Core = Amazonite::Core

module Amazonite::EC2
  # Describes the fallback behavior for an EC2 Fleet that uses reserved capacity when the reserved
  # capacity is not enough to meet the target capacity. If you don't specify fallback options, EC2
  # Fleet does not fall back to any other market type after the specified reservation types are
  # exhausted.
  class ReservedCapacityFallbackOptionsRequest
    # The instance purchasing options to fall back to when the reserved capacity is not enough to meet
    # the target capacity. The only supported value is `on-demand`, which launches On-Demand Instances
    # to fulfill the remaining target capacity.
    property market_types : Array(ReservedCapacityFallbackMarketType) | Nil

    def initialize(
      @market_types : Array(ReservedCapacityFallbackMarketType) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@market_types || [] of ReservedCapacityFallbackMarketType).each_with_index(1) do |item, i|
        params << {"#{prefix}MarketType.#{i}", item.to_json_object_key}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        market_types: node.xpath_nodes("*[local-name()='MarketType']/*[local-name()='item']").compact_map { |n| AEC::ReservedCapacityFallbackMarketType.from_json_object_key?(n.content) },
      )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@market_types)
  end
end
