private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  # Indicates how to transform ingested log events to metric data in a CloudWatch metric.
  class MetricTransformation
    include JSON::Serializable

    # The name of the CloudWatch metric.
    @[JSON::Field(key: "metricName")]
    property metric_name : String

    # A custom namespace to contain your metric in CloudWatch. Use namespaces to group together
    # metrics that are similar. For more information, see
    # [Namespaces](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace).
    @[JSON::Field(key: "metricNamespace")]
    property metric_namespace : String

    # The value to publish to the CloudWatch metric when a filter pattern matches a log event.
    @[JSON::Field(key: "metricValue")]
    property metric_value : String

    # (Optional) The value to emit when a filter pattern does not match a log event. This value can be
    # null.
    @[JSON::Field(key: "defaultValue")]
    property default_value : Float64 | Nil

    # The fields to use as dimensions for the metric. One metric filter can include as many as three
    # dimensions.
    #
    # Metrics extracted from log events are charged as custom metrics. To prevent unexpected high
    # charges, do not specify high-cardinality fields such as `IPAddress` or `requestID` as
    # dimensions. Each different value found for a dimension is treated as a separate metric and
    # accrues charges as a separate custom metric.
    #
    # CloudWatch Logs disables a metric filter if it generates 1000 different name/value pairs for
    # your specified dimensions within a certain amount of time. This helps to prevent accidental high
    # charges.
    #
    # You can also set up a billing alarm to alert you if your charges are higher than expected. For
    # more information, see [ Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services
    # Charges](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html).
    @[JSON::Field(key: "dimensions")]
    property dimensions : Hash(String, String) | Nil

    # The unit to assign to the metric. If you omit this, the unit is set as `None`.
    @[JSON::Field(key: "unit", converter: ACWL::StandardUnit)]
    property unit : StandardUnit | Nil

    def initialize(
      @metric_name : String,
      @metric_namespace : String,
      @metric_value : String,
      @default_value : Float64 | Nil = nil,
      @dimensions : Hash(String, String) | Nil = nil,
      @unit : StandardUnit | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @metric_name
        raise Core::ValidationError.new("metricName length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("metricName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("metricName does not match the required pattern") unless value.matches?(Regex.new("^[^:*$]*$"))
      end

      if value = @metric_namespace
        raise Core::ValidationError.new("metricNamespace length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("metricNamespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("metricNamespace does not match the required pattern") unless value.matches?(Regex.new("^[^:*$]*$"))
      end

      if value = @metric_value
        raise Core::ValidationError.new("metricValue length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("metricValue length must be <= 100") if value.size > 100
      end
    end

    def_equals_and_hash(@metric_name, @metric_namespace, @metric_value, @default_value, @dimensions, @unit)
  end
end
