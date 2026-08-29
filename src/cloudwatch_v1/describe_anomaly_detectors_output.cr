module Amazonite::CloudWatchV1
  class DescribeAnomalyDetectorsOutput
    include JSON::Serializable

    @[JSON::Field(key: "AnomalyDetectors")]
    property anomaly_detectors : Array(AnomalyDetector) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @anomaly_detectors : Array(AnomalyDetector) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
