private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class UpdateAnomalyRequest
    include JSON::Serializable

    # If you are suppressing or unsuppressing an anomaly, specify its unique ID here. You can find
    # anomaly IDs by using the
    # [ListAnomalies](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html)
    # operation.
    @[JSON::Field(key: "anomalyId")]
    property anomaly_id : String | Nil

    # If you are suppressing or unsuppressing an pattern, specify its unique ID here. You can find
    # pattern IDs by using the
    # [ListAnomalies](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html)
    # operation.
    @[JSON::Field(key: "patternId")]
    property pattern_id : String | Nil

    # The ARN of the anomaly detector that this operation is to act on.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String

    # Use this to specify whether the suppression to be temporary or infinite. If you specify
    # `LIMITED`, you must also specify a `suppressionPeriod`. If you specify `INFINITE`, any value for
    # `suppressionPeriod` is ignored.
    @[JSON::Field(key: "suppressionType", converter: ACWL::SuppressionType)]
    property suppression_type : SuppressionType | Nil

    # If you are temporarily suppressing an anomaly or pattern, use this structure to specify how long
    # the suppression is to last.
    @[JSON::Field(key: "suppressionPeriod")]
    property suppression_period : SuppressionPeriod | Nil

    # Set this to `true` to prevent CloudWatch Logs from displaying this behavior as an anomaly in the
    # future. The behavior is then treated as baseline behavior. However, if similar but more severe
    # occurrences of this behavior occur in the future, those will still be reported as anomalies.
    #
    # The default is `false`
    @[JSON::Field(key: "baseline")]
    property baseline : Bool | Nil

    def initialize(
      @anomaly_detector_arn : String,
      @anomaly_id : String | Nil = nil,
      @pattern_id : String | Nil = nil,
      @suppression_type : SuppressionType | Nil = nil,
      @suppression_period : SuppressionPeriod | Nil = nil,
      @baseline : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @anomaly_id
        raise Core::ValidationError.new("anomalyId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("anomalyId length must be <= 36") if value.size > 36
      end

      if value = @pattern_id
        raise Core::ValidationError.new("patternId length must be >= 32") if value.size < 32
        raise Core::ValidationError.new("patternId length must be <= 32") if value.size > 32
      end

      if value = @anomaly_detector_arn
        raise Core::ValidationError.new("anomalyDetectorArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("anomalyDetectorArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @suppression_period
        value.validate!
      end
    end

    def_equals_and_hash(@anomaly_id, @pattern_id, @anomaly_detector_arn, @suppression_type, @suppression_period, @baseline)
  end
end
