private alias ACW = Amazonite::CloudWatchV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # An anomaly detection model associated with a particular CloudWatch metric, statistic, or metric
  # math expression. You can use the model to display a band of expected, normal values when the
  # metric is graphed.
  #
  # If you have enabled unified cross-account observability, and this account is a monitoring
  # account, the metric can be in the same account or a source account.
  class AnomalyDetector
    include JSON::Serializable

    # The unique identifier of the anomaly detector.
    #
    # The identifier does not restrict access to a specific anomaly detector in an IAM policy.
    # Permissions for anomaly detector operations apply to all anomaly detectors in the account.
    @[JSON::Field(key: "AnomalyDetectorId")]
    property anomaly_detector_id : String | Nil

    # The namespace of the metric associated with the anomaly detection model.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The name of the metric associated with the anomaly detection model.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The metric dimensions associated with the anomaly detection model.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The statistic associated with the anomaly detection model.
    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    # The configuration specifies details about how the anomaly detection model is to be trained,
    # including time ranges to exclude from use for training the model, and the time zone to use for
    # the metric.
    @[JSON::Field(key: "Configuration")]
    property configuration : AnomalyDetectorConfiguration | Nil

    # The current status of the anomaly detector's training.
    @[JSON::Field(key: "StateValue", converter: ACW::AnomalyDetectorStateValue)]
    property state_value : AnomalyDetectorStateValue | Nil

    # This object includes parameters that you can use to provide information about your metric to
    # CloudWatch to help it build more accurate anomaly detection models. Currently, it includes the
    # `PeriodicSpikes` parameter.
    @[JSON::Field(key: "MetricCharacteristics")]
    property metric_characteristics : MetricCharacteristics | Nil

    # The CloudWatch metric and statistic for this anomaly detector.
    @[JSON::Field(key: "SingleMetricAnomalyDetector")]
    property single_metric_anomaly_detector : SingleMetricAnomalyDetector | Nil

    # The CloudWatch metric math expression for this anomaly detector.
    @[JSON::Field(key: "MetricMathAnomalyDetector")]
    property metric_math_anomaly_detector : MetricMathAnomalyDetector | Nil

    def initialize(
      @anomaly_detector_id : String | Nil = nil,
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @stat : String | Nil = nil,
      @configuration : AnomalyDetectorConfiguration | Nil = nil,
      @state_value : AnomalyDetectorStateValue | Nil = nil,
      @metric_characteristics : MetricCharacteristics | Nil = nil,
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

    def_equals_and_hash(@anomaly_detector_id, @namespace, @metric_name, @dimensions, @stat, @configuration, @state_value, @metric_characteristics, @single_metric_anomaly_detector, @metric_math_anomaly_detector)
  end
end
