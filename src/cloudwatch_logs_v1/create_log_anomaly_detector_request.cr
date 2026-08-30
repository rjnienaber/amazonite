private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class CreateLogAnomalyDetectorRequest
    include JSON::Serializable

    # An array containing the ARN of the log group that this anomaly detector will watch. You can
    # specify only one log group ARN.
    @[JSON::Field(key: "logGroupArnList")]
    property log_group_arn_list : Array(String) = [] of String

    # A name for this anomaly detector.
    @[JSON::Field(key: "detectorName")]
    property detector_name : String | Nil

    # Specifies how often the anomaly detector is to run and look for anomalies. Set this value
    # according to the frequency that the log group receives new logs. For example, if the log group
    # receives new log events every 10 minutes, then 15 minutes might be a good setting for
    # `evaluationFrequency` .
    @[JSON::Field(key: "evaluationFrequency", converter: ACWL::EvaluationFrequency)]
    property evaluation_frequency : EvaluationFrequency | Nil

    # You can use this parameter to limit the anomaly detection model to examine only log events that
    # match the pattern you specify here. For more information, see [Filter and Pattern
    # Syntax](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html).
    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String | Nil

    # Optionally assigns a KMS key to secure this anomaly detector and its findings. If a key is
    # assigned, the anomalies found and the model used by this detector are encrypted at rest with the
    # key. If a key is assigned to an anomaly detector, a user must have permissions for both this key
    # and for the anomaly detector to retrieve information about the anomalies that it finds.
    #
    # Make sure the value provided is a valid KMS key ARN. For more information about using a KMS key
    # and to see the required IAM policy, see [Use a KMS key with an anomaly
    # detector](https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection-KMS.html).
    @[JSON::Field(key: "kmsKeyId")]
    property kms_key_id : String | Nil

    # The number of days to have visibility on an anomaly. After this time period has elapsed for an
    # anomaly, it will be automatically baselined and the anomaly detector will treat new occurrences
    # of a similar anomaly as normal. Therefore, if you do not correct the cause of an anomaly during
    # the time period specified in `anomalyVisibilityTime`, it will be considered normal going forward
    # and will not be detected as an anomaly.
    @[JSON::Field(key: "anomalyVisibilityTime")]
    property anomaly_visibility_time : Int64 | Nil

    # An optional list of key-value pairs to associate with the resource.
    #
    # For more information about tagging, see [Tagging Amazon Web Services
    # resources](https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html)
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @log_group_arn_list : Array(String),
      @detector_name : String | Nil = nil,
      @evaluation_frequency : EvaluationFrequency | Nil = nil,
      @filter_pattern : String | Nil = nil,
      @kms_key_id : String | Nil = nil,
      @anomaly_visibility_time : Int64 | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @detector_name
        raise Core::ValidationError.new("detectorName length must be >= 1") if value.size < 1
      end

      if value = @filter_pattern
        raise Core::ValidationError.new("filterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("filterPattern length must be <= 1024") if value.size > 1024
      end

      if value = @kms_key_id
        raise Core::ValidationError.new("kmsKeyId length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("kmsKeyId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("kmsKeyId does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[a-z\\-]*:kms:[-a-z0-9]*:[0-9]*:key/[-a-z0-9]*$"))
      end

      if value = @anomaly_visibility_time
        raise Core::ValidationError.new("anomalyVisibilityTime value must be >= 7") if value < 7
        raise Core::ValidationError.new("anomalyVisibilityTime value must be <= 90") if value > 90
      end

      if value = @tags
        raise Core::ValidationError.new("tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("tags must have at most 50 entry(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@log_group_arn_list, @detector_name, @evaluation_frequency, @filter_pattern, @kms_key_id, @anomaly_visibility_time, @tags)
  end
end
