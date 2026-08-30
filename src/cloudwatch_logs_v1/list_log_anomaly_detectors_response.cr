module Amazonite::CloudWatchLogsV1
  class ListLogAnomalyDetectorsResponse
    include JSON::Serializable

    # An array of structures, where each structure in the array contains information about one anomaly
    # detector.
    @[JSON::Field(key: "anomalyDetectors")]
    property anomaly_detectors : Array(AnomalyDetector) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @anomaly_detectors : Array(AnomalyDetector) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@anomaly_detectors, @next_token)
  end
end
