private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateEventSourceMappingRequest
    include JSON::Serializable

    # The identifier of the event source mapping.
    @[JSON::Field(key: "UUID", ignore: true)]
    property uuid : String = ""

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** – `MyFunction`.
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
    #
    # - **Version or Alias ARN** – `arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD`.
    #
    # - **Partial ARN** – `123456789012:function:MyFunction`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it's
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String | Nil

    # When true, the event source mapping is active. When false, Lambda pauses polling and invocation.
    #
    # Default: True
    @[JSON::Field(key: "Enabled")]
    property enabled : Bool | Nil

    # The maximum number of records in each batch that Lambda pulls from your stream or queue and
    # sends to your function. Lambda passes all of the records in the batch to the function in a
    # single call, up to the payload limit for synchronous invocation (6 MB).
    #
    # - **Amazon Kinesis** – Default 100. Max 10,000.
    #
    # - **Amazon DynamoDB Streams** – Default 100. Max 10,000.
    #
    # - **Amazon Simple Queue Service** – Default 10. For standard queues the max is 10,000. For FIFO
    # queues the max is 10.
    #
    # - **Amazon Managed Streaming for Apache Kafka** – Default 100. Max 10,000.
    #
    # - **Self-managed Apache Kafka** – Default 100. Max 10,000.
    #
    # - **Amazon MQ (ActiveMQ and RabbitMQ)** – Default 100. Max 10,000.
    #
    # - **DocumentDB** – Default 100. Max 10,000.
    @[JSON::Field(key: "BatchSize")]
    property batch_size : Int32 | Nil

    # An object that defines the filter criteria that determine whether Lambda should process an
    # event. For more information, see [Lambda event
    # filtering](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html).
    @[JSON::Field(key: "FilterCriteria")]
    property filter_criteria : FilterCriteria | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that Lambda uses to encrypt
    # your function's [filter
    # criteria](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventfiltering.html#filtering-basics).
    # By default, Lambda does not encrypt your filter criteria object. Specify this property to
    # encrypt data using your own customer managed key.
    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    # The metrics configuration for your event source. For more information, see [Event source mapping
    # metrics](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-metrics-types.html#event-source-mapping-metrics).
    @[JSON::Field(key: "MetricsConfig")]
    property metrics_config : EventSourceMappingMetricsConfig | Nil

    @[JSON::Field(key: "LoggingConfig")]
    property logging_config : EventSourceMappingLoggingConfig | Nil

    # (Amazon SQS only) The scaling configuration for the event source. For more information, see
    # [Configuring maximum concurrency for Amazon SQS event
    # sources](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-max-concurrency).
    @[JSON::Field(key: "ScalingConfig")]
    property scaling_config : ScalingConfig | Nil

    # The maximum amount of time, in seconds, that Lambda spends gathering records before invoking the
    # function. You can configure `MaximumBatchingWindowInSeconds` to any value from 0 seconds to 300
    # seconds in increments of seconds.
    #
    # For Kinesis, DynamoDB, and Amazon SQS event sources, the default batching window is 0 seconds.
    # For Amazon MSK, Self-managed Apache Kafka, Amazon MQ, and DocumentDB event sources, the default
    # batching window is 500 ms. Note that because you can only change
    # `MaximumBatchingWindowInSeconds` in increments of seconds, you cannot revert back to the 500 ms
    # default batching window after you have changed it. To restore the default batching window, you
    # must create a new event source mapping.
    #
    # Related setting: For Kinesis, DynamoDB, and Amazon SQS event sources, when you set `BatchSize`
    # to a value greater than 10, you must set `MaximumBatchingWindowInSeconds` to at least 1.
    @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
    property maximum_batching_window_in_seconds : Int32 | Nil

    # (Kinesis and DynamoDB Streams only) The number of batches to process from each shard
    # concurrently.
    @[JSON::Field(key: "ParallelizationFactor")]
    property parallelization_factor : Int32 | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) A configuration object
    # that specifies the destination of an event after Lambda processes it.
    @[JSON::Field(key: "DestinationConfig")]
    property destination_config : DestinationConfig | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records older
    # than the specified age. The default value is infinite (-1).
    @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
    property maximum_record_age_in_seconds : Int32 | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) If the function returns
    # an error, split the batch in two and retry.
    @[JSON::Field(key: "BisectBatchOnFunctionError")]
    property bisect_batch_on_function_error : Bool | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, and self-managed Apache Kafka) Discard records after the
    # specified number of retries. The default value is infinite (-1). When set to infinite (-1),
    # failed records are retried until the record expires.
    @[JSON::Field(key: "MaximumRetryAttempts")]
    property maximum_retry_attempts : Int32 | Nil

    # (Kinesis and DynamoDB Streams only) The duration in seconds of a processing window for DynamoDB
    # and Kinesis Streams event sources. A value of 0 seconds indicates no tumbling window.
    @[JSON::Field(key: "TumblingWindowInSeconds")]
    property tumbling_window_in_seconds : Int32 | Nil

    # An array of authentication protocols or VPC components required to secure your event source.
    @[JSON::Field(key: "SourceAccessConfigurations")]
    property source_access_configurations : Array(SourceAccessConfiguration) | Nil

    # (Kinesis, DynamoDB Streams, Amazon MSK, self-managed Apache Kafka, and Amazon SQS) A list of
    # current response type enums applied to the event source mapping.
    @[JSON::Field(key: "FunctionResponseTypes", converter: Core::ArrayConverter(AL::FunctionResponseType))]
    property function_response_types : Array(FunctionResponseType) | Nil

    @[JSON::Field(key: "AmazonManagedKafkaEventSourceConfig")]
    property amazon_managed_kafka_event_source_config : AmazonManagedKafkaEventSourceConfig | Nil

    @[JSON::Field(key: "SelfManagedKafkaEventSourceConfig")]
    property self_managed_kafka_event_source_config : SelfManagedKafkaEventSourceConfig | Nil

    # Specific configuration settings for a DocumentDB event source.
    @[JSON::Field(key: "DocumentDBEventSourceConfig")]
    property document_db_event_source_config : DocumentDBEventSourceConfig | Nil

    # (Amazon SQS, Amazon MSK, and self-managed Apache Kafka only) The provisioned mode configuration
    # for the event source. For more information, see [provisioned
    # mode](https://docs.aws.amazon.com/lambda/latest/dg/invocation-eventsourcemapping.html#invocation-eventsourcemapping-provisioned-mode).
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

    def_equals_and_hash(@uuid, @function_name, @enabled, @batch_size, @filter_criteria, @kms_key_arn, @metrics_config, @logging_config, @scaling_config, @maximum_batching_window_in_seconds, @parallelization_factor, @destination_config, @maximum_record_age_in_seconds, @bisect_batch_on_function_error, @maximum_retry_attempts, @tumbling_window_in_seconds, @source_access_configurations, @function_response_types, @amazon_managed_kafka_event_source_config, @self_managed_kafka_event_source_config, @document_db_event_source_config, @provisioned_poller_config)
  end
end
