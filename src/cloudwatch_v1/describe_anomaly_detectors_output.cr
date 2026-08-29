module Amazonite::CloudWatchV1
  class DescribeAnomalyDetectorsOutput
    include JSON::Serializable

    # The list of anomaly detection models returned by the operation.
    @[JSON::Field(key: "AnomalyDetectors")]
    property anomaly_detectors : Array(AnomalyDetector) | Nil

    # A token that you can use in a subsequent operation to retrieve the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @anomaly_detectors : Array(AnomalyDetector) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
