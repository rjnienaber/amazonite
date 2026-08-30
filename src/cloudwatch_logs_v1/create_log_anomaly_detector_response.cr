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

    def_equals_and_hash(@anomaly_detector_arn)
  end
end
