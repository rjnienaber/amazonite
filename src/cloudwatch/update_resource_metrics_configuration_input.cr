private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Specifies the resource ARN and optional replacement metric selections for an
  # `UpdateResourceMetricsConfiguration` request.
  class UpdateResourceMetricsConfigurationInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the Amazon Web Services resource to update the resource
    # metrics configuration for.
    @[JSON::Field(key: "ResourceArn")]
    property resource_arn : String

    # Specifies which metrics Amazon CloudWatch collects for the resource. The selections that you
    # provide completely replace any existing metric selections.
    #
    # If you omit this parameter, Amazon CloudWatch removes any existing metric selection filter and
    # collects all available detailed metrics for the resource.
    @[JSON::Field(key: "MetricSelections")]
    property metric_selections : Array(ResourceMetricSelection) | Nil

    def initialize(
      @resource_arn : String,
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

    def_equals_and_hash(@resource_arn, @metric_selections)
  end
end
