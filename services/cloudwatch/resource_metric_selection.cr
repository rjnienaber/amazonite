private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Specifies which metrics Amazon CloudWatch collects for a resource metrics configuration. Include
  # this in a
  # [CreateResourceMetricsConfiguration](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_CreateResourceMetricsConfiguration.html)
  # or
  # [UpdateResourceMetricsConfiguration](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UpdateResourceMetricsConfiguration.html)
  # request to limit collection to a specific set of metrics. If you omit metric selections, Amazon
  # CloudWatch collects all available detailed metrics for the resource.
  class ResourceMetricSelection
    include JSON::Serializable

    # The names of the metrics to collect for the resource. Amazon CloudWatch collects only the
    # metrics that you list here.
    @[JSON::Field(key: "IncludeMetrics")]
    property include_metrics : Array(String) = [] of String

    def initialize(
      @include_metrics : Array(String),
    )
    end

    def validate! : Nil
      if value = @include_metrics
        raise Core::ValidationError.new("IncludeMetrics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("IncludeMetrics must have at most 500 item(s)") if value.size > 500
      end
    end

    def_equals_and_hash(@include_metrics)
  end
end
