module Amazonite::CloudWatchLogsV1
  class PutMetricFilterRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # A name for the metric filter.
    @[JSON::Field(key: "filterName")]
    property filter_name : String

    # A filter pattern for extracting metric data out of ingested log events.
    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String

    # A collection of information that defines how metric data gets emitted.
    @[JSON::Field(key: "metricTransformations")]
    property metric_transformations : Array(MetricTransformation) = [] of MetricTransformation

    # This parameter is valid only for log groups that have an active log transformer. For more
    # information about log transformers, see
    # [PutTransformer](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html).
    #
    # If the log group uses either a log-group level or account-level transformer, and you specify
    # `true`, the metric filter will be applied on the transformed version of the log events instead
    # of the original ingested log events.
    @[JSON::Field(key: "applyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    # A filter expression that specifies which log events should be processed by this metric filter
    # based on system fields such as source account and source region. Uses selection criteria syntax
    # with operators like `=`, `!=`, `AND`, `OR`, `IN`, `NOT IN`. Example: `@aws.region = "us-east-1"`
    # or `@aws.account IN ["123456789012", "987654321098"]`. Maximum length: 2000 characters.
    @[JSON::Field(key: "fieldSelectionCriteria")]
    property field_selection_criteria : String | Nil

    # A list of system fields to emit as additional dimensions in the generated metrics. Valid values
    # are `@aws.account` and `@aws.region`. These dimensions help identify the source of centralized
    # log data and count toward the total dimension limit for metric filters.
    @[JSON::Field(key: "emitSystemFieldDimensions")]
    property emit_system_field_dimensions : Array(String) | Nil

    def initialize(
      @log_group_name : String,
      @filter_name : String,
      @filter_pattern : String,
      @metric_transformations : Array(MetricTransformation),
      @apply_on_transformed_logs : Bool | Nil = nil,
      @field_selection_criteria : String | Nil = nil,
      @emit_system_field_dimensions : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_name, @filter_name, @filter_pattern, @metric_transformations, @apply_on_transformed_logs, @field_selection_criteria, @emit_system_field_dimensions)
  end
end
