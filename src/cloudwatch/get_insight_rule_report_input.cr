private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class GetInsightRuleReportInput
    include JSON::Serializable

    # The name of the rule that you want to see data from.
    @[JSON::Field(key: "RuleName")]
    property rule_name : String

    # The start time of the data to use in the report. When used in a raw HTTP Query API, it is
    # formatted as `yyyy-MM-dd'T'HH:mm:ss`. For example, `2019-07-01T23:59:59`.
    @[JSON::Field(key: "StartTime", converter: Core::AWSEpochConverter)]
    property start_time : Time

    # The end time of the data to use in the report. When used in a raw HTTP Query API, it is
    # formatted as `yyyy-MM-dd'T'HH:mm:ss`. For example, `2019-07-01T23:59:59`.
    @[JSON::Field(key: "EndTime", converter: Core::AWSEpochConverter)]
    property end_time : Time

    # The period, in seconds, to use for the statistics in the `InsightRuleMetricDatapoint` results.
    @[JSON::Field(key: "Period")]
    property period : Int32

    # The maximum number of contributors to include in the report. The range is 1 to 100. If you omit
    # this, the default of 10 is used.
    @[JSON::Field(key: "MaxContributorCount")]
    property max_contributor_count : Int32 | Nil

    # Specifies which metrics to use for aggregation of contributor values for the report. You can
    # specify one or more of the following metrics:
    #
    # - `UniqueContributors` -- the number of unique contributors for each data point.
    #
    # - `MaxContributorValue` -- the value of the top contributor for each data point. The identity of
    # the contributor might change for each data point in the graph.
    #
    # If this rule aggregates by COUNT, the top contributor for each data point is the contributor
    # with the most occurrences in that period. If the rule aggregates by SUM, the top contributor is
    # the contributor with the highest sum in the log field specified by the rule's `Value`, during
    # that period.
    #
    # - `SampleCount` -- the number of data points matched by the rule.
    #
    # - `Sum` -- the sum of the values from all contributors during the time period represented by
    # that data point.
    #
    # - `Minimum` -- the minimum value from a single observation during the time period represented by
    # that data point.
    #
    # - `Maximum` -- the maximum value from a single observation during the time period represented by
    # that data point.
    #
    # - `Average` -- the average value from all contributors during the time period represented by
    # that data point.
    @[JSON::Field(key: "Metrics")]
    property metrics : Array(String) | Nil

    # Determines what statistic to use to rank the contributors. Valid values are `Sum` and `Maximum`.
    @[JSON::Field(key: "OrderBy")]
    property order_by : String | Nil

    def initialize(
      @rule_name : String,
      @start_time : Time,
      @end_time : Time,
      @period : Int32,
      @max_contributor_count : Int32 | Nil = nil,
      @metrics : Array(String) | Nil = nil,
      @order_by : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @rule_name
        raise Core::ValidationError.new("RuleName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuleName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("RuleName does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end

      if value = @period
        raise Core::ValidationError.new("Period value must be >= 1") if value < 1
      end

      if value = @order_by
        raise Core::ValidationError.new("OrderBy length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("OrderBy length must be <= 32") if value.size > 32
        raise Core::ValidationError.new("OrderBy does not match the required pattern") unless value.matches?(Regex.new("^[\\x20-\\x7E]+$"))
      end
    end

    def_equals_and_hash(@rule_name, @start_time, @end_time, @period, @max_contributor_count, @metrics, @order_by)
  end
end
