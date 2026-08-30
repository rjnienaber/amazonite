module Amazonite::CloudWatchV1
  # This structure contains a metric namespace and optionally, a list of metric names, to either
  # include in a metric stream or exclude from a metric stream.
  #
  # A metric stream's filters can include up to 1000 total names. This limit applies to the sum of
  # namespace names and metric names in the filters. For example, this could include 10 metric
  # namespace filters with 99 metrics each, or 20 namespace filters with 49 metrics specified in
  # each filter.
  class MetricStreamFilter
    include JSON::Serializable

    # The name of the metric namespace for this filter.
    #
    # The namespace can contain only ASCII printable characters (ASCII range 32 through 126). It must
    # contain at least one non-whitespace character.
    @[JSON::Field(key: "Namespace")]
    property namespace : String | Nil

    # The names of the metrics to either include or exclude from the metric stream.
    #
    # If you omit this parameter, all metrics in the namespace are included or excluded, depending on
    # whether this filter is specified as an exclude filter or an include filter.
    #
    # Each metric name can contain only ASCII printable characters (ASCII range 32 through 126). Each
    # metric name must contain at least one non-whitespace character.
    @[JSON::Field(key: "MetricNames")]
    property metric_names : Array(String) | Nil

    def initialize(
      @namespace : String | Nil = nil,
      @metric_names : Array(String) | Nil = nil,
    )
    end
  end
end
