private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class CreateLogAnomalyDetectorResponse
    include JSON::Serializable

    # The ARN of the log anomaly detector that you just created.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String | Nil

    def initialize(
      @anomaly_detector_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @anomaly_detector_arn
        raise Core::ValidationError.new("anomalyDetectorArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("anomalyDetectorArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end
    end

    def_equals_and_hash(@anomaly_detector_arn)
  end
end
