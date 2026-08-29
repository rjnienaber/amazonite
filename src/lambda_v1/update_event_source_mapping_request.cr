private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateEventSourceMappingRequest
    include JSON::Serializable

    @[JSON::Field(key: "UUID", ignore: true)]
    property uuid : String = ""

    @[JSON::Field(key: "FunctionName")]
    property function_name : String | Nil

    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    @[JSON::Field(key: "BatchSize")]
    property batch_size : Int32 | Nil

    @[JSON::Field(key: "FilterCriteria")]
    property filter_criteria : FilterCriteria | Nil

    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    @[JSON::Field(key: "MetricsConfig")]
    property metrics_config : EventSourceMappingMetricsConfig | Nil

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : EventSourceMappingLoggingConfig | Nil

    @[JSON::Field(key: "ScalingConfig")]
    property scaling_config : ScalingConfig | Nil

    @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
    property maximum_batching_window_in_seconds : Int32 | Nil

    @[JSON::Field(key: "ParallelizationFactor")]
    property parallelization_factor : Int32 | Nil

    @[JSON::Field(key: "DestinationConfig")]
    property destination_config : DestinationConfig | Nil

    @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
    property maximum_record_age_in_seconds : Int32 | Nil

    @[JSON::Field(key: "BisectBatchOnFunctionError")]
    property bisect_batch_on_function_error : Bool | Nil

    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    @[JSON::Field(key: "TumblingWindowInSeconds")]
    property tumbling_window_in_seconds : Int32 | Nil

    @[JSON::Field(key: "SourceAccessConfigurations")]
    property source_access_configurations : Array(SourceAccessConfiguration) | Nil

    @[JSON::Field(key: "FunctionResponseTypes", converter: Core::ArrayConverter(AL::FunctionResponseType))]
    property function_response_types : Array(FunctionResponseType) | Nil

    @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
    property amazon_managed_kafka_event_source_config : AmazonManagedKafkaEventSourceConfig | Nil

    @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
    property self_managed_kafka_event_source_config : SelfManagedKafkaEventSourceConfig | Nil

    @[JSON::Field(key: "DocumentDBEventSourceConfig")]
    property document_db_event_source_config : DocumentDBEventSourceConfig | Nil

    @[JSON::Field(key: "ProvisionedPollerConfig")]
    property provisioned_poller_config : ProvisionedPollerConfig | Nil

    def initialize(
      @uuid : String,
      @function_name : String | Nil = nil,
      @enabled : Bool | Nil = nil,
      @batch_size : Int32 | Nil = nil,
      @filter_criteria : FilterCriteria | Nil = nil,
      @kms_key_arn : String | Nil = nil,
      @metrics_config : EventSourceMappingMetricsConfig | Nil = nil,
      @logging_config : EventSourceMappingLoggingConfig | Nil = nil,
      @scaling_config : ScalingConfig | Nil = nil,
      @maximum_batching_window_in_seconds : Int32 | Nil = nil,
      @parallelization_factor : Int32 | Nil = nil,
      @destination_config : DestinationConfig | Nil = nil,
      @maximum_record_age_in_seconds : Int32 | Nil = nil,
      @bisect_batch_on_function_error : Bool | Nil = nil,
      @maximum_retry_attempts : Int32 | Nil = nil,
      @tumbling_window_in_seconds : Int32 | Nil = nil,
      @source_access_configurations : Array(SourceAccessConfiguration) | Nil = nil,
      @function_response_types : Array(FunctionResponseType) | Nil = nil,
      @amazon_managed_kafka_event_source_config : AmazonManagedKafkaEventSourceConfig | Nil = nil,
      @self_managed_kafka_event_source_config : SelfManagedKafkaEventSourceConfig | Nil = nil,
      @document_db_event_source_config : DocumentDBEventSourceConfig | Nil = nil,
      @provisioned_poller_config : ProvisionedPollerConfig | Nil = nil,
    )
    end
  end
end
