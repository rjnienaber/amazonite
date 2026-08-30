private alias ACWL = Amazonite::CloudWatchLogsV1

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
  end
end
