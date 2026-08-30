private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # A mapping between an Amazon Web Services resource and a Lambda function. For details, see
  # CreateEventSourceMapping.
  class EventSourceMappingConfiguration
    include JSON::Serializable

    # The identifier of the event source mapping.
    @[JSON::Field(key: "UUID")]
    property uuid : String | Nil

    # The position in a stream from which to start reading. Required for Amazon Kinesis and Amazon
    # DynamoDB Stream event sources. `AT_TIMESTAMP` is supported only for Amazon Kinesis streams,
    # Amazon DocumentDB, Amazon MSK, and self-managed Apache Kafka.
    @[JSON::Field(key: "StartingPosition", converter: AL::EventSourcePosition)]
    property starting_position : EventSourcePosition | Nil

    # With `StartingPosition` set to `AT_TIMESTAMP`, the time from which to start reading.
    # `StartingPositionTimestamp` cannot be in the future.
    @[JSON::Field(key: "StartingPositionTimestamp", converter: Core::AWSEpochConverter)]
    property starting_position_timestamp : Time | Nil

    # The maximum number of records in each batch that Lambda pulls from your stream or queue and
    # sends to your function. Lambda passes all of the records in the batch to the function in a
    # single call, up to the payload limit for synchronous invocation (6 MB).
    #
    # Default value: Varies by service. For Amazon SQS, the default is 10. For all other services, the
    # default is 100.
    #
    # Related setting: When you set `BatchSize` to a value greater than 10, you must set
    # `MaximumBatchingWindowInSeconds` to at least 1.
    @[JSON::Field(key: "BatchSize")]
    property batch_size : Int32 | Nil

    # The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the
    # function. You can configure `MaximumBatchingWindowInSeconds` to any value from 0 seconds to 300
    # seconds in increments of seconds.
    #
    # For streams and Amazon SQS event sources, the default batching window is 0 seconds. For Amazon
    # MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB event sources, the default batching
    # window is 500 ms. Note that because you can only change `MaximumBatchingWindowInSeconds` in
    # increments of seconds, you cannot revert back to the 500 ms default batching window after you
    # have changed it. To restore the default batching window, you must create a new event source
    # mapping.
    #
    # Related setting: For streams and Amazon SQS event sources, when you set `BatchSize` to a value
    # greater than 10, you must set `MaximumBatchingWindowInSeconds` to at least 1.
    @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
    property maximum_batching_window_in_seconds : Int32 | Nil

    # (Kinesis and DynamoDB Streams only) The number of batches to process concurrently from each
    # shard. The default value is 1.
    @[JSON::Field(key: "ParallelizationFactor")]
    property parallelization_factor : Int32 | Nil

    # The Amazon Resource Name (ARN) of the event source.
    @[JSON::Field(key: "EventSourceArn")]
    property event_source_arn : String | Nil

    # An object that defines the filter criteria that determine whether Lambda should process an
    # event. For more information, see [Lambda event
    # filtering](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html).
    #
    # If filter criteria is encrypted, this field shows up as `null` in the response of
    # ListEventSourceMapping API calls. You can view this field in plaintext in the response of
    # GetEventSourceMapping and DeleteEventSourceMapping calls if you have `kms:Decrypt` permissions
    # for the correct KMS key.
    @[JSON::Field(key: "FilterCriteria")]
    property filter_criteria : FilterCriteria | Nil

    # An object that contains details about an error related to filter criteria encryption.
    @[JSON::Field(key: "FilterCriteriaError")]
    property filter_criteria_error : FilterCriteriaError | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that Lambda uses to encrypt
    # your function's [filter
    # criteria](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-basics).
    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    # The metrics configuration for your event source. For more information, see [Event source mapping
    # metrics](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics).
    @[JSON::Field(key: "MetricsConfig")]
    property metrics_config : EventSourceMappingMetricsConfig | Nil

    # (Amazon MSK, and self-managed Apache Kafka only) The logging configuration for your event
    # source. For more information, see [Event source mapping
    # logging](https://docs.aws.amazon.com/lambda/latest/dg/esm-logging.html).
    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : EventSourceMappingLoggingConfig | Nil

    # (Amazon SQS only) The scaling configuration for the event source. For more information, see
    # [Configuring maximum concurrency for Amazon SQS event
    # sources](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency).
    @[JSON::Field(key: "ScalingConfig")]
    property scaling_config : ScalingConfig | Nil

    # The ARN of the Lambda function.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    # The date that the event source mapping was last updated or that its state changed.
    @[JSON::Field(key: "LastModified", converter: Core::AWSEpochConverter)]
    property last_modified : Time | Nil

    # The result of the event source mapping's last processing attempt.
    @[JSON::Field(key: "LastProcessingResult")]
    property last_processing_result : String | Nil

    # The state of the event source mapping. It can be one of the following: `Creating`, `Enabling`,
    # `Enabled`, `Disabling`, `Disabled`, `Updating`, or `Deleting`.
    @[JSON::Field(key: "State")]
    property state : String | Nil

    # Indicates whether a user or Lambda made the last change to the event source mapping.
    @[JSON::Field(key: "StateTransitionReason")]
    property state_transition_reason : String | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A configuration object
    # that specifies the destination of an event after Lambda processes it.
    @[JSON::Field(key: "DestinationConfig")]
    property destination_config : DestinationConfig | Nil

    # The name of the Kafka topic.
    @[JSON::Field(key: "Topics")]
    property topics : Array(String) | Nil

    # (Amazon MQ) The name of the Amazon MQ broker destination queue to consume.
    @[JSON::Field(key: "Queues")]
    property queues : Array(String) | Nil

    # An array of the authentication protocol, VPC components, or virtual host to secure and define
    # your event source.
    @[JSON::Field(key: "SourceAccessConfigurations")]
    property source_access_configurations : Array(SourceAccessConfiguration) | Nil

    # The self-managed Apache Kafka cluster for your event source.
    @[JSON::Field(key: "SelfManagedEventSource")]
    property self_managed_event_source : SelfManagedEventSource | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records older
    # than the specified age. The default value is -1, which sets the maximum age to infinite. When
    # the value is set to infinite, Lambda never discards old records.
    #
    # The minimum valid value for maximum record age is 60s. Although values less than 60 and greater
    # than -1 fall within the parameter's absolute range, they are not allowed
    @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
    property maximum_record_age_in_seconds : Int32 | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If the function returns
    # an error, split the batch in two and retry. The default value is false.
    @[JSON::Field(key: "BisectBatchOnFunctionError")]
    property bisect_batch_on_function_error : Bool | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records after the
    # specified number of retries. The default value is -1, which sets the maximum number of retries
    # to infinite. When MaximumRetryAttempts is infinite, Lambda retries failed records until the
    # record expires in the event source.
    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    # (Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB
    # and Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.
    @[JSON::Field(key: "TumblingWindowInSeconds")]
    property tumbling_window_in_seconds : Int32 | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and Amazon SQS) A list of
    # current response type enums applied to the event source mapping.
    @[JSON::Field(key: "FunctionResponseTypes", converter: Core::ArrayConverter(AL::FunctionResponseType))]
    property function_response_types : Array(FunctionResponseType) | Nil

    # Specific configuration settings for an Amazon Managed Streaming for Apache Kafka (Amazon MSK)
    # event source.
    @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
    property amazon_managed_kafka_event_source_config : AmazonManagedKafkaEventSourceConfig | Nil

    # Specific configuration settings for a self-managed Apache Kafka event source.
    @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
    property self_managed_kafka_event_source_config : SelfManagedKafkaEventSourceConfig | Nil

    # Specific configuration settings for a DocumentDB event source.
    @[JSON::Field(key: "DocumentDBEventSourceConfig")]
    property document_db_event_source_config : DocumentDBEventSourceConfig | Nil

    # The Amazon Resource Name (ARN) of the event source mapping.
    @[JSON::Field(key: "EventSourceMappingArn")]
    property event_source_mapping_arn : String | Nil

    # (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The provisioned mode configuration
    # for the event source. For more information, see [provisioned
    # mode](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode).
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

    def validate! : Nil
      if value = @uuid
        raise Core::ValidationError.new("UUID length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("UUID length must be <= 36") if value.size > 36
      end

      if value = @batch_size
        raise Core::ValidationError.new("BatchSize value must be >= 1") if value < 1
        raise Core::ValidationError.new("BatchSize value must be <= 10000") if value > 10000
      end

      if value = @maximum_batching_window_in_seconds
        raise Core::ValidationError.new("MaximumBatchingWindowInSeconds value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaximumBatchingWindowInSeconds value must be <= 300") if value > 300
      end

      if value = @parallelization_factor
        raise Core::ValidationError.new("ParallelizationFactor value must be >= 1") if value < 1
        raise Core::ValidationError.new("ParallelizationFactor value must be <= 10") if value > 10
      end

      if value = @event_source_arn
        raise Core::ValidationError.new("EventSourceArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventSourceArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("EventSourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\-])+:((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1})?:(\\d{12})?:(.*)$"))
      end

      if value = @filter_criteria
        value.validate!
      end

      if value = @filter_criteria_error
        value.validate!
      end

      if value = @kms_key_arn
        raise Core::ValidationError.new("KMSKeyArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("KMSKeyArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("KMSKeyArn does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()$"))
      end

      if value = @metrics_config
        value.validate!
      end

      if value = @logging_config
        value.validate!
      end

      if value = @scaling_config
        value.validate!
      end

      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @destination_config
        value.validate!
      end

      if value = @topics
        raise Core::ValidationError.new("Topics must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Topics must have at most 1 item(s)") if value.size > 1
      end

      if value = @queues
        raise Core::ValidationError.new("Queues must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Queues must have at most 1 item(s)") if value.size > 1
      end

      if value = @source_access_configurations
        raise Core::ValidationError.new("SourceAccessConfigurations must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("SourceAccessConfigurations must have at most 23 item(s)") if value.size > 23
        value.each(&.validate!)
      end

      if value = @self_managed_event_source
        value.validate!
      end

      if value = @maximum_record_age_in_seconds
        raise Core::ValidationError.new("MaximumRecordAgeInSeconds value must be >= -1") if value < -1
        raise Core::ValidationError.new("MaximumRecordAgeInSeconds value must be <= 604800") if value > 604800
      end

      if value = @maximum_retry_attempts
        raise Core::ValidationError.new("MaximumRetryAttempts value must be >= -1") if value < -1
        raise Core::ValidationError.new("MaximumRetryAttempts value must be <= 10000") if value > 10000
      end

      if value = @tumbling_window_in_seconds
        raise Core::ValidationError.new("TumblingWindowInSeconds value must be >= 0") if value < 0
        raise Core::ValidationError.new("TumblingWindowInSeconds value must be <= 900") if value > 900
      end

      if value = @function_response_types
        raise Core::ValidationError.new("FunctionResponseTypes must have at least 0 item(s)") if value.size < 0
        raise Core::ValidationError.new("FunctionResponseTypes must have at most 1 item(s)") if value.size > 1
      end

      if value = @amazon_managed_kafka_event_source_config
        value.validate!
      end

      if value = @self_managed_kafka_event_source_config
        value.validate!
      end

      if value = @document_db_event_source_config
        value.validate!
      end

      if value = @event_source_mapping_arn
        raise Core::ValidationError.new("EventSourceMappingArn length must be >= 85") if value.size < 85
        raise Core::ValidationError.new("EventSourceMappingArn length must be <= 120") if value.size > 120
        raise Core::ValidationError.new("EventSourceMappingArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:event-source-mapping:[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$"))
      end

      if value = @provisioned_poller_config
        value.validate!
      end
    end

    def_equals_and_hash(@uuid, @starting_position, @starting_position_timestamp, @batch_size, @maximum_batching_window_in_seconds, @parallelization_factor, @event_source_arn, @filter_criteria, @filter_criteria_error, @kms_key_arn, @metrics_config, @logging_config, @scaling_config, @function_arn, @last_modified, @last_processing_result, @state, @state_transition_reason, @destination_config, @topics, @queues, @source_access_configurations, @self_managed_event_source, @maximum_record_age_in_seconds, @bisect_batch_on_function_error, @maximum_retry_attempts, @tumbling_window_in_seconds, @function_response_types, @amazon_managed_kafka_event_source_config, @self_managed_kafka_event_source_config, @document_db_event_source_config, @event_source_mapping_arn, @provisioned_poller_config)
  end
end
