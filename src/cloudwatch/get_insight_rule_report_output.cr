private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetInsightRuleReportOutput
    include JSON::Serializable

    # An array of the strings used as the keys for this rule. The keys are the dimensions used to
    # classify contributors. If the rule contains more than one key, then each unique combination of
    # values for the keys is counted as a unique contributor.
    @[JSON::Field(key: "KeyLabels")]
    property key_labels : Array(String) | Nil

    # Specifies whether this rule aggregates contributor data by COUNT or SUM.
    @[JSON::Field(key: "AggregationStatistic")]
    property aggregation_statistic : String | Nil

    # The sum of the values from all individual contributors that match the rule.
    @[JSON::Field(key: "AggregateValue")]
    property aggregate_value : Float64 | Nil

    # An approximate count of the unique contributors found by this rule in this time period.
    @[JSON::Field(key: "ApproximateUniqueCount")]
    property approximate_unique_count : Int64 | Nil

    # An array of the unique contributors found by this rule in this time period. If the rule contains
    # multiple keys, each combination of values for the keys counts as a unique contributor.
    @[JSON::Field(key: "Contributors")]
    property contributors : Array(InsightRuleContributor) | Nil

    # A time series of metric data points that matches the time period in the rule request.
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

    def validate! : Nil
      if value = @contributors
        value.each(&.validate!)
      end

      if value = @metric_datapoints
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@key_labels, @aggregation_statistic, @aggregate_value, @approximate_unique_count, @contributors, @metric_datapoints)
  end
end
