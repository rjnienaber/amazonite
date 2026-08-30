private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # One data point from the metric time series returned in a Contributor Insights rule report.
  #
  # For more information, see
  # [GetInsightRuleReport](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetInsightRuleReport.html).
  class InsightRuleMetricDatapoint
    include JSON::Serializable

    # The timestamp of the data point.
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time

    # The number of unique contributors who published data during this timestamp.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "UniqueContributors")]
    property unique_contributors : Float64 | Nil

    # The maximum value provided by one contributor during this timestamp. Each timestamp is evaluated
    # separately, so the identity of the max contributor could be different for each timestamp.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "MaxContributorValue")]
    property max_contributor_value : Float64 | Nil

    # The number of occurrences that matched the rule during this data point.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "SampleCount")]
    property sample_count : Float64 | Nil

    # The average value from all contributors during the time period represented by that data point.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "Average")]
    property average : Float64 | Nil

    # The sum of the values from all contributors during the time period represented by that data
    # point.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "Sum")]
    property sum : Float64 | Nil

    # The minimum value from a single contributor during the time period represented by that data
    # point.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "Minimum")]
    property minimum : Float64 | Nil

    # The maximum value from a single occurence from a single contributor during the time period
    # represented by that data point.
    #
    # This statistic is returned only if you included it in the `Metrics` array in your request.
    @[JSON::Field(key: "Maximum")]
    property maximum : Float64 | Nil

    def initialize(
      @timestamp : Time,
      @unique_contributors : Float64 | Nil = nil,
      @max_contributor_value : Float64 | Nil = nil,
      @sample_count : Float64 | Nil = nil,
      @average : Float64 | Nil = nil,
      @sum : Float64 | Nil = nil,
      @minimum : Float64 | Nil = nil,
      @maximum : Float64 | Nil = nil,
    )
    end

    def_equals_and_hash(@timestamp, @unique_contributors, @max_contributor_value, @sample_count, @average, @sum, @minimum, @maximum)
  end
end
