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
  end
end
