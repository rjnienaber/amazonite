private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Represents a resource metrics configuration for an Amazon Web Services resource. A resource
  # metrics configuration enables detailed metric collection for the resource that is identified by
  # its Amazon Resource Name (ARN). Each Amazon Web Services resource can have only one resource
  # metrics configuration.
  #
  # This structure is returned by the
  # [CreateResourceMetricsConfiguration](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_CreateResourceMetricsConfiguration.html),
  # [UpdateResourceMetricsConfiguration](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UpdateResourceMetricsConfiguration.html),
  # and
  # [GetResourceMetricsConfiguration](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_GetResourceMetricsConfiguration.html)
  # operations.
  class ResourceMetricsConfiguration
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Amazon Web Services resource that this configuration
    # applies to.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # The date and time that the resource metrics configuration was created.
    @[JSON::Field(key: "CreatedAt", converter: Core::AWSEpochConverter)]
    property created_at : Time

    # The date and time that the resource metrics configuration was last updated. When the
    # configuration is first created, this value is the same as `CreatedAt`.
    @[JSON::Field(key: "UpdatedAt", converter: Core::AWSEpochConverter)]
    property updated_at : Time

    # The metrics that Amazon CloudWatch collects for the resource. If this field is not present,
    # Amazon CloudWatch collects all available detailed metrics for the resource.
    @[JSON::Field(key: "MetricSelections")]
    property metric_selections : Array(ResourceMetricSelection) | Nil

    def initialize(
      @resource_arn : String,
      @created_at : Time,
      @updated_at : Time,
      @metric_selections : Array(ResourceMetricSelection) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceArn length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("ResourceArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ResourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[a-zA-Z0-9-]+:[a-zA-Z0-9-]+:[a-zA-Z0-9-]*:\\d{12}:.+$"))
      end

      if value = @metric_selections
        raise Core::ValidationError.new("MetricSelections must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("MetricSelections must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_arn, @created_at, @updated_at, @metric_selections)
  end
end
