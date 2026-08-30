private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Represents a subscription filter.
  class SubscriptionFilter
    include JSON::Serializable

    # The name of the subscription filter.
    @[JSON::Field(key: "filterName")]
    property filter_name : String | Nil

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String | Nil

    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String | Nil

    # The Amazon Resource Name (ARN) of the destination.
    @[JSON::Field(key: "destinationArn")]
    property destination_arn : String | Nil

    @[JSON::Field(key: "roleArn")]
    property role_arn : String | Nil

    @[JSON::Field(key: "distribution", converter: ACWL::Distribution)]
    property distribution : Distribution | Nil

    # This parameter is valid only for log groups that have an active log transformer. For more
    # information about log transformers, see
    # [PutTransformer](https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutTransformer.html).
    #
    # If this value is `true`, the subscription filter is applied on the transformed version of the
    # log events instead of the original ingested log events.
    @[JSON::Field(key: "applyOnTransformedLogs")]
    property apply_on_transformed_logs : Bool | Nil

    # The creation time of the subscription filter, expressed as the number of milliseconds after `Jan
    # 1, 1970 00:00:00 UTC`.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The filter expression that specifies which log events are processed by this subscription filter
    # based on system fields. Returns the `fieldSelectionCriteria` value if it was specified when the
    # subscription filter was created.
    @[JSON::Field(key: "fieldSelectionCriteria")]
    property field_selection_criteria : String | Nil

    # The list of system fields that are included in the log events sent to the subscription
    # destination. Returns the `emitSystemFields` value if it was specified when the subscription
    # filter was created.
    @[JSON::Field(key: "emitSystemFields")]
    property emit_system_fields : Array(String) | Nil

    def initialize(
      @filter_name : String | Nil = nil,
      @log_group_name : String | Nil = nil,
      @filter_pattern : String | Nil = nil,
      @destination_arn : String | Nil = nil,
      @role_arn : String | Nil = nil,
      @distribution : Distribution | Nil = nil,
      @apply_on_transformed_logs : Bool | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @field_selection_criteria : String | Nil = nil,
      @emit_system_fields : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@filter_name, @log_group_name, @filter_pattern, @destination_arn, @role_arn, @distribution, @apply_on_transformed_logs, @creation_time, @field_selection_criteria, @emit_system_fields)
  end
end
