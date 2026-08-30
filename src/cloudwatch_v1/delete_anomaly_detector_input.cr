private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @anomaly_detector_id
        raise Core::ValidationError.new("AnomalyDetectorId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AnomalyDetectorId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("AnomalyDetectorId does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9_./:%()+-]+$"))
      end

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

      if value = @single_metric_anomaly_detector
        value.validate!
      end

      if value = @metric_math_anomaly_detector
        value.validate!
      end
    end

    def_equals_and_hash(@anomaly_detector_id, @namespace, @metric_name, @dimensions, @stat, @single_metric_anomaly_detector, @metric_math_anomaly_detector)
  end
end
