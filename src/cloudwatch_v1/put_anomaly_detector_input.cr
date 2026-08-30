private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[^:]"))
      end

      if value = @metric_name
        raise Core::ValidationError.new("MetricName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("MetricName length must be <= 255") if value.size > 255
      end

      if value = @dimensions
        raise Core::ValidationError.new("Dimensions must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("Dimensions must have at most 30 item(s)") if value.size > 30
        value.each(&.validate!)
      end

      if value = @stat
        raise Core::ValidationError.new("Stat length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Stat length must be <= 50") if value.size > 50
        raise Core::ValidationError.new("Stat does not match the required pattern") unless value.matches?(Regex.new("^(SampleCount|Average|Sum|Minimum|Maximum|IQM|(p|tc|tm|ts|wm)(\\d{1,2}(\\.\\d{0,10})?|100)|[ou]\\d+(\\.\\d*)?)(_E|_L|_H)?|(TM|TC|TS|WM)\\(((((\\d{1,2})(\\.\\d{0,10})?|100(\\.0{0,10})?)%)?:((\\d{1,2})(\\.\\d{0,10})?|100(\\.0{0,10})?)%|((\\d{1,2})(\\.\\d{0,10})?|100(\\.0{0,10})?)%:(((\\d{1,2})(\\.\\d{0,10})?|100(\\.0{0,10})?)%)?)\\)|(TM|TC|TS|WM|PR)\\(((\\d+(\\.\\d{0,10})?|(\\d+(\\.\\d{0,10})?[Ee][+-]?\\d+)):((\\d+(\\.\\d{0,10})?|(\\d+(\\.\\d{0,10})?[Ee][+-]?\\d+)))?|((\\d+(\\.\\d{0,10})?|(\\d+(\\.\\d{0,10})?[Ee][+-]?\\d+)))?:(\\d+(\\.\\d{0,10})?|(\\d+(\\.\\d{0,10})?[Ee][+-]?\\d+)))\\)$"))
      end

      if value = @configuration
        value.validate!
      end

      if value = @metric_characteristics
        value.validate!
      end

      if value = @single_metric_anomaly_detector
        value.validate!
      end

      if value = @metric_math_anomaly_detector
        value.validate!
      end
    end

    def_equals_and_hash(@namespace, @metric_name, @dimensions, @stat, @configuration, @metric_characteristics, @single_metric_anomaly_detector, @metric_math_anomaly_detector)
  end
end
