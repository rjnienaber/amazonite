module Amazonite::CloudWatchLogsV1
  class GetLogAnomalyDetectorRequest
    include JSON::Serializable

    # The ARN of the anomaly detector to retrieve information about. You can find the ARNs of log
    # anomaly detectors in your account by using the
    # [ListLogAnomalyDetectors](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html)
    # operation.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String

    def initialize(
      @anomaly_detector_arn : String,
    )
    end
  end
end
