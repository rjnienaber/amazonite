private alias Core = Amazonite::Core

module Amazonite::EC2
  class DescribeOutpostLagsResult
    # The Outpost LAGs.
    property outpost_lags : Array(OutpostLag) | Nil

    # The token to use to retrieve the next page of results. This value is `null` when there are no
    # more results to return.
    property next_token : String | Nil

    def initialize(
      @outpost_lags : Array(OutpostLag) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@outpost_lags || [] of OutpostLag).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}OutpostLagSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        outpost_lags: node.xpath_nodes("*[local-name()='outpostLagSet']/*[local-name()='item']").map { |n| OutpostLag.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @outpost_lags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@outpost_lags, @next_token)
  end
end
