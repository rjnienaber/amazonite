private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class EventSourceMappingConfiguration
    include JSON::Serializable

    @[JSON::Field(key: "UUID")]
    property uuid : String | Nil

    @[JSON::Field(key: "StartingPosition", converter: AL::EventSourcePosition)]
    property starting_position : EventSourcePosition | Nil

    @[JSON::Field(key: "StartingPositionTimestamp", converter: Core::AWSEpochConverter)]
    property starting_position_timestamp : Time | Nil

    @[JSON::Field(key: "BatchSize")]
    property batch_size : Int32 | Nil

    @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
    property maximum_batching_window_in_seconds : Int32 | Nil

    @[JSON::Field(key: "ParallelizationFactor")]
    property parallelization_factor : Int32 | Nil

    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    @[JSON::Field(key: "FilterCriteria")]
    property filter_criteria : FilterCriteria | Nil

    @[JSON::Field(key: "FilterCriteriaError")]
    property filter_criteria_error : FilterCriteriaError | Nil

    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "MetricsConfig")]
    property metrics_config : EventSourceMappingMetricsConfig | Nil

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : EventSourceMappingLoggingConfig | Nil

    @[JSON::Field(key: "ScalingConfig")]
    property scaling_config : ScalingConfig | Nil

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    @[JSON::Field(key: "LastModified", converter: Core::AWSEpochConverter)]
    property last_modified : Time | Nil

    @[JSON::Field(key: "LastProcessingResult")]
    property last_processing_result : String | Nil

    @[JSON::Field(key: "State")]
    property state : String | Nil

    @[JSON::Field(key: "StateTransitionReason")]
    property state_transition_reason : String | Nil

    @[JSON::Field(key: "DestinationConfig")]
    property destination_config : DestinationConfig | Nil

    @[JSON::Field(key: "Topics")]
    property topics : Array(String) | Nil

    @[JSON::Field(key: "Queues")]
    property queues : Array(String) | Nil

    @[JSON::Field(key: "SourceAccessConfigurations")]
    property source_access_configurations : Array(SourceAccessConfiguration) | Nil

    @[JSON::Field(key: "SelfManagedEventSource")]
    property self_managed_event_source : SelfManagedEventSource | Nil

    @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
    property maximum_record_age_in_seconds : Int32 | Nil

    @[JSON::Field(key: "BisectBatchOnFunctionError")]
    property bisect_batch_on_function_error : Bool | Nil

    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    @[JSON::Field(key: "TumblingWindowInSeconds")]
    property tumbling_window_in_seconds : Int32 | Nil

    @[JSON::Field(key: "FunctionResponseTypes", converter: Core::ArrayConverter(AL::FunctionResponseType))]
    property function_response_types : Array(FunctionResponseType) | Nil

    @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
    property amazon_managed_kafka_event_source_config : AmazonManagedKafkaEventSourceConfig | Nil

    @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
    property self_managed_kafka_event_source_config : SelfManagedKafkaEventSourceConfig | Nil

    @[JSON::Field(key: "DocumentDBEventSourceConfig")]
    property document_db_event_source_config : DocumentDBEventSourceConfig | Nil

    @[JSON::Field(key: "EventSourceMappingArn")]
    property event_source_mapping_arn : String | Nil

    @[JSON::Field(key: "ProvisionedPollerConfig")]
    property provisioned_poller_config : ProvisionedPollerConfig | Nil

    def initialize(
      @uuid : String | Nil = nil,
      @starting_position : EventSourcePosition | Nil = nil,
      @starting_position_timestamp : Time | Nil = nil,
      @batch_size : Int32 | Nil = nil,
      @maximum_batching_window_in_seconds : Int32 | Nil = nil,
      @parallelization_factor : Int32 | Nil = nil,
      @event_source_arn : String | Nil = nil,
      @filter_criteria : FilterCriteria | Nil = nil,
      @filter_criteria_error : FilterCriteriaError | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @metrics_config : EventSourceMappingMetricsConfig | Nil = nil,
      @logging_config : EventSourceMappingLoggingConfig | Nil = nil,
      @scaling_config : ScalingConfig | Nil = nil,
      @function_arn : String | Nil = nil,
      @last_modified : Time | Nil = nil,
      @last_processing_result : String | Nil = nil,
      @state : String | Nil = nil,
      @state_transition_reason : String | Nil = nil,
      @destination_config : DestinationConfig | Nil = nil,
      @topics : Array(String) | Nil = nil,
      @queues : Array(String) | Nil = nil,
      @source_access_configurations : Array(SourceAccessConfiguration) | Nil = nil,
      @self_managed_event_source : SelfManagedEventSource | Nil = nil,
      @maximum_record_age_in_seconds : Int32 | Nil = nil,
      @bisect_batch_on_function_error : Bool | Nil = nil,
      @maximum_retry_attempts : Int32 | Nil = nil,
      @tumbling_window_in_seconds : Int32 | Nil = nil,
      @function_response_types : Array(FunctionResponseType) | Nil = nil,
      @amazon_managed_kafka_event_source_config : AmazonManagedKafkaEventSourceConfig | Nil = nil,
      @self_managed_kafka_event_source_config : SelfManagedKafkaEventSourceConfig | Nil = nil,
      @document_db_event_source_config : DocumentDBEventSourceConfig | Nil = nil,
      @event_source_mapping_arn : String | Nil = nil,
      @provisioned_poller_config : ProvisionedPollerConfig | Nil = nil,
    )
    end
  end
end
