private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class MetricDatum
    include JSON::Serializable

    @[JSON::Field(key: "MetricName")]
    property metric_name : String

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "Timestamp", converter: Core::AWSEpochConverter)]
    property timestamp : Time | Nil

    @[JSON::Field(key: "Value")]
    property value : Float64 | Nil

    @[JSON::Field(key: "StatisticValues")]
    property statistic_values : StatisticSet | Nil

    @[JSON::Field(key: "Values")]
    property values : Array(Float64) | Nil

    @[JSON::Field(key: "Counts")]
    property counts : Array(Float64) | Nil

    @[JSON::Field(key: "Unit", converter: ACW::StandardUnit)]
    property unit : StandardUnit | Nil

    @[JSON::Field(key: "StorageResolution")]
    property storage_resolution : Int32 | Nil

    def initialize(
      @metric_name : String,
      @dimensions : Array(Dimension) | Nil = nil,
      @timestamp : Time | Nil = nil,
      @value : Float64 | Nil = nil,
      @statistic_values : StatisticSet | Nil = nil,
      @values : Array(Float64) | Nil = nil,
      @counts : Array(Float64) | Nil = nil,
      @unit : StandardUnit | Nil = nil,
      @storage_resolution : Int32 | Nil = nil,
    )
    end
  end
end
