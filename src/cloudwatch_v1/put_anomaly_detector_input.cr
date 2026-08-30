module Amazonite::CloudWatchV1
  class PutAnomalyDetectorInput
    include JSON::Serializable

    # The namespace of the metric to create the anomaly detection model for.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The name of the metric to create the anomaly detection model for.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The metric dimensions to create the anomaly detection model for.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The statistic to use for the metric and the anomaly detection model.
    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    # The configuration specifies details about how the anomaly detection model is to be trained,
    # including time ranges to exclude when training and updating the model. You can specify as many
    # as 10 time ranges.
    #
    # The configuration can also include the time zone to use for the metric.
    @[JSON::Field(key: "Configuration")]
    property configuration : AnomalyDetectorConfiguration | Nil

    # Use this object to include parameters to provide information about your metric to CloudWatch to
    # help it build more accurate anomaly detection models. Currently, it includes the
    # `PeriodicSpikes` parameter.
    @[JSON::Field(key: "MetricCharacteristics")]
    property metric_characteristics : MetricCharacteristics | Nil

    # A single metric anomaly detector to be created.
    #
    # When using `SingleMetricAnomalyDetector`, you cannot include the following parameters in the
    # same operation:
    #
    # - `Dimensions`
    #
    # - `MetricName`
    #
    # - `Namespace`
    #
    # - `Stat`
    #
    # - the `MetricMathAnomalyDetector` parameters of `PutAnomalyDetectorInput`
    #
    # Instead, specify the single metric anomaly detector attributes as part of the property
    # `SingleMetricAnomalyDetector`.
    @[JSON::Field(key: "SingleMetricAnomalyDetector")]
    property single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil

    # The metric math anomaly detector to be created.
    #
    # When using `MetricMathAnomalyDetector`, you cannot include the following parameters in the same
    # operation:
    #
    # - `Dimensions`
    #
    # - `MetricName`
    #
    # - `Namespace`
    #
    # - `Stat`
    #
    # - the `SingleMetricAnomalyDetector` parameters of `PutAnomalyDetectorInput`
    #
    # Instead, specify the metric math anomaly detector attributes as part of the property
    # `MetricMathAnomalyDetector`.
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

    def_equals_and_hash(@namespace, @metric_name, @dimensions, @stat, @configuration, @metric_characteristics, @single_metric_anomaly_detector, @metric_math_anomaly_detector)
  end
end
