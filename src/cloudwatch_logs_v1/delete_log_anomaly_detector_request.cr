private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DeleteLogAnomalyDetectorRequest
    include JSON::Serializable

    # The ARN of the anomaly detector to delete. You can find the ARNs of log anomaly detectors in
    # your account by using the
    # [ListLogAnomalyDetectors](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html)
    # operation.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String

    def initialize(
      @anomaly_detector_arn : String,
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
