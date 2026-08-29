module Amazonite::CloudWatchV1
  class PutAnomalyDetectorOutput
    include JSON::Serializable

    @[JSON::Field(key: "AnomalyDetectorId")]
    property anomaly_detector_id : String | Nil

    def initialize(
      @anomaly_detector_id : String | Nil = nil,
    )
    end
  end
end
