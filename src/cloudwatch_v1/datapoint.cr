private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class Datapoint
    include JSON::Serializable

    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    @[JSON::Field(key: "SampleCount")]
    property sample_count : Float64 | Nil

    @[JSON::Field(key: "Average")]
    property average : Float64 | Nil

    @[JSON::Field(key: "Sum")]
    property sum : Float64 | Nil

    @[JSON::Field(key: "Minimum")]
    property minimum : Float64 | Nil

    @[JSON::Field(key: "Maximum")]
    property maximum : Float64 | Nil

    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

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
