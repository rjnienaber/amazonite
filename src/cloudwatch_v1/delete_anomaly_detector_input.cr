module Amazonite::CloudWatchV1
  class DeleteAnomalyDetectorInput
    include JSON::Serializable

    # Specifies the unique identifier of the anomaly detector to delete. If you specify this
    # parameter, you do not need to specify a metric to identify the detector.
    @[JSON::Field(key: "AnomalyDetectorId")]
    property anomaly_detector_id : String | Nil

    # The namespace associated with the anomaly detection model to delete.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The metric name associated with the anomaly detection model to delete.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The metric dimensions associated with the anomaly detection model to delete.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The statistic associated with the anomaly detection model to delete.
    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    # A single metric anomaly detector to be deleted.
    #
    # When using `SingleMetricAnomalyDetector`, you cannot include the following parameters in the
    # same operation:
    #
    # - `Dimensions`,
    #
    # - `MetricName`
    #
    # - `Namespace`
    #
    # - `Stat`
    #
    # - the `MetricMathAnomalyDetector` parameters of `DeleteAnomalyDetectorInput`
    #
    # Instead, specify the single metric anomaly detector attributes as part of the
    # `SingleMetricAnomalyDetector` property.
    @[JSON::Field(key: "SingleMetricAnomalyDetector")]
    property single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil

    # The metric math anomaly detector to be deleted.
    #
    # When using `MetricMathAnomalyDetector`, you cannot include following parameters in the same
    # operation:
    #
    # - `Dimensions`,
    #
    # - `MetricName`
    #
    # - `Namespace`
    #
    # - `Stat`
    #
    # - the `SingleMetricAnomalyDetector` parameters of `DeleteAnomalyDetectorInput`
    #
    # Instead, specify the metric math anomaly detector attributes as part of the
    # `MetricMathAnomalyDetector` property.
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
