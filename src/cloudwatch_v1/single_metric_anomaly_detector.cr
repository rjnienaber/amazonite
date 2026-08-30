private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Designates the CloudWatch metric and statistic that provides the time series the anomaly
  # detector uses as input. If you have enabled unified cross-account observability, and this
  # account is a monitoring account, the metric can be in the same account or a source account.
  class SingleMetricAnomalyDetector
    include JSON::Serializable

    # If the CloudWatch metric that provides the time series that the anomaly detector uses as input
    # is in another account, specify that account ID here. If you omit this parameter, the current
    # account is used.
    @[JSON::Field(key: "AccountId")]
    property account_id : String | Nil

    # The namespace of the metric to create the anomaly detection model for.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The name of the metric to create the anomaly detection model for.
    @[JSON::Field(key: "MetricName")]
    property metric_name : String | Nil

    # The metric dimensions to create the anomaly detection model for.
    @[JSON::Field(key: "Dimensions")]
    property dimensions : Array(Dimension) | Nil

    # The statistic to use for the metric and anomaly detection model.
    @[JSON::Field(key: "Stat")]
    property stat : String | Nil

    def initialize(
      @account_id : String | Nil = nil,
      @namespace : String | Nil = nil,
      @metric_name : String | Nil = nil,
      @dimensions : Array(Dimension) | Nil = nil,
      @stat : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @account_id
        raise Core::ValidationError.new("AccountId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AccountId length must be <= 255") if value.size > 255
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
    end

    def_equals_and_hash(@account_id, @namespace, @metric_name, @dimensions, @stat)
  end
end
