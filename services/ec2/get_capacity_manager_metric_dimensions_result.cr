private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerMetricDimensionsResult
    # The available dimension combinations that have data within the specified time range and filters.
    property metric_dimension_results : Array(CapacityManagerDimension) | Nil

    # The token to use to retrieve the next page of results. This value is null when there are no more
    # results to return.
    property next_token : String | Nil

    def initialize(
      @metric_dimension_results : Array(CapacityManagerDimension) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@metric_dimension_results || [] of CapacityManagerDimension).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MetricDimensionResultSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_dimension_results: node.xpath_nodes("*[local-name()='metricDimensionResultSet']/*[local-name()='item']").map { |n| CapacityManagerDimension.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @metric_dimension_results
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_dimension_results, @next_token)
  end
end
