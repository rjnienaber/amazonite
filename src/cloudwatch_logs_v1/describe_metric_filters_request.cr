private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeMetricFiltersRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # The prefix to match. CloudWatch Logs uses the value that you set here only if you also include
    # the `logGroupName` parameter in your request.
    @[JSON::Field(key: "filterNamePrefix")]
    property filter_name_prefix : String | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    # The maximum number of items returned. If you don't specify a value, the default is up to 50
    # items.
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # Filters results to include only those with the specified metric name. If you include this
    # parameter in your request, you must also include the `metricNamespace` parameter.
    @[JSON::Field(key: "metricName")]
    property metric_name : String | Nil

    # Filters results to include only those in the specified namespace. If you include this parameter
    # in your request, you must also include the `metricName` parameter.
    @[JSON::Field(key: "metricNamespace")]
    property metric_namespace : String | Nil

    def initialize(
      @log_group_name : String | Nil = nil,
      @filter_name_prefix : String | Nil = nil,
      @next_token : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @metric_name : String | Nil = nil,
      @metric_namespace : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @filter_name_prefix
        raise Core::ValidationError.new("filterNamePrefix length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("filterNamePrefix length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("filterNamePrefix does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end

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
    end

    def_equals_and_hash(@log_group_name, @filter_name_prefix, @next_token, @limit, @metric_name, @metric_namespace)
  end
end
