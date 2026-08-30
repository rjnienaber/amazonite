private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Metric filters express how CloudWatch Logs would extract metric observations from ingested log
  # events and transform them into metric data in a CloudWatch metric.
  class MetricFilter
    include JSON::Serializable

    # The name of the metric filter.
    @[JSON::Field(key: "filterName")]
    property filter_name : String | Nil

    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String | Nil

    # The metric transformations.
    @[JSON::Field(key: "metricTransformations")]
    property metric_transformations : Array(MetricTransformation) | Nil

    # The creation time of the metric filter, expressed as the number of milliseconds after `Jan 1,
    # 1970 00:00:00 UTC`.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    # This parameter is valid only for log groups that have an active log transformer. For more
    # information about log transformers, see
    # [PutTransformer](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html).
    #
    # If this value is `true`, the metric filter is applied on the transformed version of the log
    # events instead of the original ingested log events.
    @[JSON::Field(key: "applyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    # The filter expression that specifies which log events are processed by this metric filter based
    # on system fields. Returns the `fieldSelectionCriteria` value if it was specified when the metric
    # filter was created.
    @[JSON::Field(key: "fieldSelectionCriteria")]
    property field_selection_criteria : String | Nil

    # The list of system fields that are emitted as additional dimensions in the generated metrics.
    # Returns the `emitSystemFieldDimensions` value if it was specified when the metric filter was
    # created.
    @[JSON::Field(key: "emitSystemFieldDimensions")]
    property emit_system_field_dimensions : Array(String) | Nil

    def initialize(
      @filter_name : String | Nil = nil,
      @filter_pattern : String | Nil = nil,
      @metric_transformations : Array(MetricTransformation) | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @log_group_name : String | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
      @field_selection_criteria : String | Nil = nil,
      @emit_system_field_dimensions : Array(String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @filter_name
        raise Core::ValidationError.new("filterName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("filterName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("filterName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end

      if value = @filter_pattern
        raise Core::ValidationError.new("filterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("filterPattern length must be <= 1024") if value.size > 1024
      end

      if value = @metric_transformations
        raise Core::ValidationError.new("metricTransformations must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("metricTransformations must have at most 1 item(s)") if value.size > 1
        value.each(&.validate!)
      end

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @log_group_name
        raise Core::ValidationError.new("logGroupName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logGroupName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_/#A-Za-z0-9]+$"))
      end

      if value = @field_selection_criteria
        raise Core::ValidationError.new("fieldSelectionCriteria length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("fieldSelectionCriteria length must be <= 2000") if value.size > 2000
      end
    end

    def_equals_and_hash(@filter_name, @filter_pattern, @metric_transformations, @creation_time, @log_group_name, @apply_on_transformed_logs, @field_selection_criteria, @emit_system_field_dimensions)
  end
end
