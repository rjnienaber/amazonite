module Amazonite::CloudWatchLogsV1
  class DescribeMetricFiltersResponse
    include JSON::Serializable

    # The metric filters.
    @[JSON::Field(key: "metricFilters")]
    property metric_filters : Array(MetricFilter) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @metric_filters : Array(MetricFilter) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@metric_filters, @next_token)
  end
end
