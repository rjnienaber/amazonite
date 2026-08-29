private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  class DescribeAnomalyDetectorsInput
    include JSON::Serializable

    @[JSON::Field(key: "AnomalyDetectorIds")]
    property anomaly_detector_ids : Array(String) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "AnomalyDetectorTypes", converter: Core::ArrayConverter(ACW::AnomalyDetectorType))]
    property anomaly_detector_types : Array(AnomalyDetectorType) | Nil

    def initialize(
      @anomaly_detector_ids : Array(String) | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @anomaly_detector_types : Array(AnomalyDetectorType) | Nil = nil,
    )
    end
  end
end
