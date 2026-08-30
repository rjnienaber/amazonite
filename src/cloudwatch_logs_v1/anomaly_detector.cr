private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Contains information about one anomaly detector in the account.
  class AnomalyDetector
    include JSON::Serializable

    # The ARN of the anomaly detector.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String | Nil

    # The name of the anomaly detector.
    @[JSON::Field(key: "detectorName")]
    property detector_name : String | Nil

    # A list of the ARNs of the log groups that this anomaly detector watches.
    @[JSON::Field(key: "logGroupArnList")]
    property log_group_arn_list : Array(String) | Nil

    # Specifies how often the anomaly detector runs and look for anomalies.
    @[JSON::Field(key: "evaluationFrequency", converter: ACWL::EvaluationFrequency)]
    property evaluation_frequency : EvaluationFrequency | Nil

    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String | Nil

    # Specifies the current status of the anomaly detector. To pause an anomaly detector, use the
    # `enabled` parameter in the
    # [UpdateLogAnomalyDetector](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html)
    # operation.
    @[JSON::Field(key: "anomalyDetectorStatus", converter: ACWL::AnomalyDetectorStatus)]
    property anomaly_detector_status : AnomalyDetectorStatus | Nil

    # The ARN of the KMS key assigned to this anomaly detector, if any.
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    # The date and time when this anomaly detector was created.
    @[JSON::Field(key: "creationTimeStamp")]
    property creation_time_stamp : Int64 | Nil

    # The date and time when this anomaly detector was most recently modified.
    @[JSON::Field(key: "lastModifiedTimeStamp")]
    property last_modified_time_stamp : Int64 | Nil

    # The number of days used as the life cycle of anomalies. After this time, anomalies are
    # automatically baselined and the anomaly detector model will treat new occurrences of similar
    # event as normal.
    @[JSON::Field(key: "anomalyVisibilityTime")]
    property anomaly_visibility_time : Int64 | Nil

    def initialize(
      @anomaly_detector_arn : String | Nil = nil,
      @detector_name : String | Nil = nil,
      @log_group_arn_list : Array(String) | Nil = nil,
      @evaluation_frequency : EvaluationFrequency | Nil = nil,
      @filter_pattern : String | Nil = nil,
      @anomaly_detector_status : AnomalyDetectorStatus | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @creation_time_stamp : Int64 | Nil = nil,
      @last_modified_time_stamp : Int64 | Nil = nil,
      @anomaly_visibility_time : Int64 | Nil = nil,
    )
    end
  end
end
