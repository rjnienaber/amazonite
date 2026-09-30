private alias Core = Amazonite::Core

module Amazonite::EC2
  # Contains the output of DescribeSpotPriceHistory.
  class DescribeSpotPriceHistoryResult
    # The token to include in another request to get the next page of items. This value is an empty
    # string (`""`) or `null` when there are no more items to return.
    property next_token : String | Nil

    # The historical Spot prices.
    property spot_price_history : Array(SpotPrice) | Nil

    def initialize(
      @next_token : String | Nil = nil,
      @spot_price_history : Array(SpotPrice) | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end

      (@spot_price_history || [] of SpotPrice).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}SpotPriceHistorySet.#{i}."))
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
        spot_price_history: node.xpath_nodes("*[local-name()='spotPriceHistorySet']/*[local-name()='item']").map { |n| SpotPrice.from_xml(n) },
      )
    end

    def validate! : Nil
      if value = @spot_price_history
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@next_token, @spot_price_history)
  end
end
