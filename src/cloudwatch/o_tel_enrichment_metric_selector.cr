private alias Core = Amazonite::Core

module Amazonite::CloudWatch
  # Selects the metrics in one namespace, for use in the `IncludeFilters` or `ExcludeFilters`
  # parameter of
  # [StartOTelEnrichment](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_StartOTelEnrichment.html)
  # or
  # [UpdateOTelEnrichment](https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_UpdateOTelEnrichment.html).
  #
  # A maximum of 100 selectors is allowed across `IncludeFilters` and `ExcludeFilters` combined.
  class OTelEnrichmentMetricSelector
    include JSON::Serializable

    # The namespace of the metrics to select. Namespaces are matched exactly and are case-sensitive.
    @[JSON::Field(key: "Namespace")]
    property namespace : String

    # The names of the metrics to select within the namespace. Metric names are matched exactly and
    # are case-sensitive. If this parameter is omitted, every metric in the namespace is selected.
    #
    # A maximum of 100 metric names is allowed for each selector.
    @[JSON::Field(key: "MetricNames")]
    property metric_names : Array(String) | Nil

    def initialize(
      @namespace : String,
      @metric_names : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @namespace
        raise Core::ValidationError.new("Namespace length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Namespace length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("Namespace does not match the required pattern") unless value.matches?(Regex.new("^[^:]"))
      end

      if value = @metric_names
        raise Core::ValidationError.new("MetricNames must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("MetricNames must have at most 100 item(s)") if value.size > 100
      end
    end

    def_equals_and_hash(@namespace, @metric_names)
  end
end
