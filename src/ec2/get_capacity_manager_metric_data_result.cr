private alias Core = Amazonite::Core

module Amazonite::EC2
  class GetCapacityManagerMetricDataResult
    # The metric data points returned by the query. Each result contains dimension values, timestamp,
    # and metric values with their associated statistics.
    property metric_data_results : Array(MetricDataResult) | Nil

    # The token to use to retrieve the next page of results. This value is null when there are no more
    # results to return.
    property next_token : String | Nil

    def initialize(
      @metric_data_results : Array(MetricDataResult) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def to_query_params(prefix : String) : Array({String, String})
      params = [] of {String, String}

      (@metric_data_results || [] of MetricDataResult).each_with_index(1) do |item, i|
        params.concat(item.to_query_params("#{prefix}MetricDataResultSet.#{i}."))
      end

      if value = @next_token
        params << {"#{prefix}NextToken", value}
      end
      params
    end

    def self.from_xml(node : XML::Node) : self
      new(
        metric_data_results: node.xpath_nodes("*[local-name()='metricDataResultSet']/*[local-name()='item']").map { |n| MetricDataResult.from_xml(n) },
        next_token: Core::XMLValue.string(node.xpath_node("*[local-name()='nextToken']")),
      )
    end

    def validate! : Nil
      if value = @metric_data_results
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_data_results, @next_token)
  end
end
