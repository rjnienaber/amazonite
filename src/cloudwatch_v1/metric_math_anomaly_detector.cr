private alias Core = Amazonite::Core

module Amazonite::CloudWatchV1
  # Indicates the CloudWatch math expression that provides the time series the anomaly detector uses
  # as input. The designated math expression must return a single time series.
  class MetricMathAnomalyDetector
    include JSON::Serializable

    # An array of metric data query structures that enables you to create an anomaly detector based on
    # the result of a metric math expression. Each item in `MetricDataQueries` gets a metric or
    # performs a math expression. One item in `MetricDataQueries` is the expression that provides the
    # time series that the anomaly detector uses as input. Designate the expression by setting
    # `ReturnData` to `true` for this object in the array. For all other expressions and metrics, set
    # `ReturnData` to `false`. The designated expression must return a single time series.
    @[JSON::Field(key: "MetricDataQueries")]
    property metric_data_queries : Array(MetricDataQuery) | Nil

    def initialize(
      @metric_data_queries : Array(MetricDataQuery) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @metric_data_queries
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@metric_data_queries)
  end
end
