private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class UpdateLogAnomalyDetectorRequest
    include JSON::Serializable

    # The ARN of the anomaly detector that you want to update.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String

    # Specifies how often the anomaly detector runs and look for anomalies. Set this value according
    # to the frequency that the log group receives new logs. For example, if the log group receives
    # new log events every 10 minutes, then setting `evaluationFrequency` to `FIFTEEN_MIN` might be
    # appropriate.
    @[JSON::Field(key: "evaluationFrequency", converter: ACWL::EvaluationFrequency)]
    property evaluation_frequency : EvaluationFrequency | Nil

    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String | Nil

    # The number of days to use as the life cycle of anomalies. After this time, anomalies are
    # automatically baselined and the anomaly detector model will treat new occurrences of similar
    # event as normal. Therefore, if you do not correct the cause of an anomaly during this time, it
    # will be considered normal going forward and will not be detected.
    @[JSON::Field(key: "anomalyVisibilityTime")]
    property anomaly_visibility_time : Int64 | Nil

    # Use this parameter to pause or restart the anomaly detector.
    @[JSON::Field(key: "enabled")]
    property enabled : Bool

    def initialize(
      @anomaly_detector_arn : String,
      @enabled : Bool,
      @evaluation_frequency : EvaluationFrequency | Nil = nil,
      @filter_pattern : String | Nil = nil,
      @anomaly_visibility_time : Int64 | Nil = nil,
    )
    end
  end
end
