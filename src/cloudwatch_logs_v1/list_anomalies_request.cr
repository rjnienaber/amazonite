private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class ListAnomaliesRequest
    include JSON::Serializable

    # Use this to optionally limit the results to only the anomalies found by a certain anomaly
    # detector.
    @[JSON::Field(key: "anomalyDetectorArn")]
    property anomaly_detector_arn : String | Nil

    # You can specify this parameter if you want to the operation to return only anomalies that are
    # currently either suppressed or unsuppressed.
    @[JSON::Field(key: "suppressionState", converter: ACWL::SuppressionState)]
    property suppression_state : SuppressionState | Nil

    # The maximum number of items to return. If you don't specify a value, the default maximum value
    # of 50 items is used.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @anomaly_detector_arn : String | Nil = nil,
      @suppression_state : SuppressionState | Nil = nil,
      @limit : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @anomaly_detector_arn
        raise Core::ValidationError.new("anomalyDetectorArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("anomalyDetectorArn does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@anomaly_detector_arn, @suppression_state, @limit, @next_token)
  end
end
