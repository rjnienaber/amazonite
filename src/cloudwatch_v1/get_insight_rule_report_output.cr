module Amazonite::CloudWatchV1
  class GetInsightRuleReportOutput
    include JSON::Serializable

    @[JSON::Field(key: "KeyLabels")]
    property key_labels : Array(String) | Nil

    @[JSON::Field(key: "AggregationStatistic")]
    property aggregation_statistic : String | Nil

    @[JSON::Field(key: "AggregateValue")]
    property aggregate_value : Float64 | Nil

    @[JSON::Field(key: "ApproximateUniqueCount")]
    property approximate_unique_count : Int64 | Nil

    @[JSON::Field(key: "Contributors")]
    property contributors : Array(InsightRuleContributor) | Nil

    @[JSON::Field(key: "MetricDatapoints")]
    property metric_datapoints : Array(InsightRuleMetricDatapoint) | Nil

    def initialize(
      @key_labels : Array(String) | Nil = nil,
      @aggregation_statistic : String | Nil = nil,
      @aggregate_value : Float64 | Nil = nil,
      @approximate_unique_count : Int64 | Nil = nil,
      @contributors : Array(InsightRuleContributor) | Nil = nil,
      @metric_datapoints : Array(InsightRuleMetricDatapoint) | Nil = nil,
    )
    end
  end
end
