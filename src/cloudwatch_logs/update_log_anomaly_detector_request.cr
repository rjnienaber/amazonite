private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @anomaly_detector_arn
        raise Core::ValidationError.new("anomalyDetectorArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("anomalyDetectorArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @filter_pattern
        raise Core::ValidationError.new("filterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("filterPattern length must be <= 1024") if value.size > 1024
      end

      if value = @anomaly_visibility_time
        raise Core::ValidationError.new("anomalyVisibilityTime value must be >= 7") if value < 7
        raise Core::ValidationError.new("anomalyVisibilityTime value must be <= 90") if value > 90
      end
    end

    def_equals_and_hash(@anomaly_detector_arn, @evaluation_frequency, @filter_pattern, @anomaly_visibility_time, @enabled)
  end
end
