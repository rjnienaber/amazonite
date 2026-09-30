private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  class PutAnomalyDetectorOutput
    include JSON::Serializable

    # The unique identifier of the anomaly detector that you created or updated.
    @[JSON::Field(key: "AnomalyDetectorId")]
    property anomaly_detector_id : String | Nil

    def initialize(
      @anomaly_detector_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @anomaly_detector_id
        raise Core::ValidationError.new("AnomalyDetectorId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AnomalyDetectorId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AnomalyDetectorId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_./:%()+-]+$"))
      end
    end

    def_equals_and_hash(@anomaly_detector_id)
  end
end
