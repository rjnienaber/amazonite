module Amazonite::CloudWatchV1
  class PutAnomalyDetectorInput
    include JSON::Serializable

    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    @[JSON::Field(key: "Configuration")]
    property configuration : AnomalyDetectorConfiguration | Nil

    @[JSON::Field(key: "MetricCharacteristics")]
    property metric_characteristics : MetricCharacteristics | Nil

    @[JSON::Field(key: "SingleMetricAnomalyDetector")]
    property single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil

    @[JSON::Field(key: "MetricMathAnomalyDetector")]
    property metric_math_anomaly_detector : MetricMathAnomalyDetector | Nil

    def initialize(
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @stat : String | Nil = nil,
      @configuration : AnomalyDetectorConfiguration | Nil = nil,
      @metric_characteristics : MetricCharacteristics | Nil = nil,
      @single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil = nil,
      @metric_math_anomaly_detector : MetricMathAnomalyDetector | Nil = nil,
    )
    end
  end
end
