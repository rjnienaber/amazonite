module Amazonite::CloudWatchV1
  class DeleteAnomalyDetectorInput
    include JSON::Serializable

    @[JSON::Field(key: "AnomalyDetectorId")]
    property anomaly_detector_id : String | Nil

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    @[JSON::Field(key: "SingleMetricAnomalyDetector")]
    property single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil

    @[JSON::Field(key: "MetricMathAnomalyDetector")]
    property metric_math_anomaly_detector : MetricMathAnomalyDetector | Nil

    def initialize(
      @anomaly_detector_id : String | Nil = nil,
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @stat : String | Nil = nil,
      @single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil = nil,
      @metric_math_anomaly_detector : MetricMathAnomalyDetector | Nil = nil,
    )
    end
  end
end
