private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Encapsulates the statistical data that CloudWatch computes from metric data.
  class Datapoint
    include JSON::Serializable

    # The time stamp used for the data point.
    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    # The number of metric values that contributed to the aggregate value of this data point.
    @[JSON::Field(key: "SampleCount")]
    property sample_count : Float64 | Nil

    # The average of the metric values that correspond to the data point.
    @[JSON::Field(key: "Average")]
    property average : Float64 | Nil

    # The sum of the metric values for the data point.
    @[JSON::Field(key: "Sum")]
    property sum : Float64 | Nil

    # The minimum metric value for the data point.
    @[JSON::Field(key: "Minimum")]
    property minimum : Float64 | Nil

    # The maximum metric value for the data point.
    @[JSON::Field(key: "Maximum")]
    property maximum : Float64 | Nil

    # The standard unit for the data point.
    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    # The percentile statistic for the data point.
    @[JSON::Field(key: "ExtendedStatistics")]
    property extended_statistics : Hash(String, Float64) | Nil

    def initialize(
      @timestamp : Time | Nil = nil,
      @sample_count : Float64 | Nil = nil,
      @average : Float64 | Nil = nil,
      @sum : Float64 | Nil = nil,
      @minimum : Float64 | Nil = nil,
      @maximum : Float64 | Nil = nil,
      @unit : StandardUnit | Nil = nil,
      @extended_statistics : Hash(String, Float64) | Nil = nil,
    )
    end
  end
end
