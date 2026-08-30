private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @anomaly_detectors
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@anomaly_detectors, @next_token)
  end
end
