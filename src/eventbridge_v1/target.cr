private alias Core = Amazonite::Core

module Amazonite::EventBridgeV1
  # Targets are the resources to be invoked when a rule is triggered. For a complete list of
  # services and resources that can be set as a target, see
  # [PutTargets](https://docs.aws.amazon.com/eventbridge/latest/APIReference/API_PutTargets.html).
  #
  # If you are setting the event bus of another account as the target, and that account granted
  # permission to your account through an organization instead of directly by the account ID, then
  # you must specify a `RoleArn` with proper permissions in the `Target` structure. For more
  # information, see [Sending and Receiving Events Between Amazon Web Services
  # Accounts](https://docs.aws.amazon.com/eventbridge/latest/userguide/eventbridge-cross-account-event-delivery.html)
  # in the *Amazon EventBridge User Guide*.
  class Target
    include JSON::Serializable

    # The ID of the target within the specified rule. Use this ID to reference the target when
    # updating the rule. We recommend using a memorable and unique string.
    @[JSON::Field(key: "Id")]
    property id : String

    # The Amazon Resource Name (ARN) of the target.
    @[JSON::Field(key: "Arn")]
    property arn : String

    # The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is
    # triggered. If one rule triggers multiple targets, you can use a different IAM role for each
    # target.
    @[JSON::Field(key: "RoleArn")]
    property role_arn : String | Nil

    # Valid JSON text passed to the target. In this case, nothing from the event itself is passed to
    # the target. For more information, see [The JavaScript Object Notation (JSON) Data Interchange
    # Format](http://www.rfc-editor.org/rfc/rfc7159.txt).
    @[JSON::Field(key: "Input")]
    property input : String | Nil

    # The value of the JSONPath that is used for extracting part of the matched event when passing it
    # to the target. You may use JSON dot notation or bracket notation. For more information about
    # JSON paths, see [JSONPath](http://goessner.net/articles/JsonPath/).
    @[JSON::Field(key: "InputPath")]
    property input_path : String | Nil

    # Settings to enable you to provide custom input to a target based on certain event data. You can
    # extract one or more key-value pairs from the event and then use that data to send customized
    # input to the target.
    @[JSON::Field(key: "InputTransformer")]
    property input_transformer : InputTransformer | Nil

    # The custom parameter you can use to control the shard assignment, when the target is a Kinesis
    # data stream. If you do not include this parameter, the default is to use the `eventId` as the
    # partition key.
    @[JSON::Field(key: "KinesisParameters")]
    property kinesis_parameters : KinesisParameters | Nil

    # Parameters used when you are using the rule to invoke Amazon EC2 Run Command.
    @[JSON::Field(key: "RunCommandParameters")]
    property run_command_parameters : RunCommandParameters | Nil

    # Contains the Amazon ECS task definition and task count to be used, if the event target is an
    # Amazon ECS task. For more information about Amazon ECS tasks, see [Task Definitions
    # ](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_defintions.html) in the
    # *Amazon EC2 Container Service Developer Guide*.
    @[JSON::Field(key: "EcsParameters")]
    property ecs_parameters : EcsParameters | Nil

    # If the event target is an Batch job, this contains the job definition, job name, and other
    # parameters. For more information, see
    # [Jobs](https://docs.aws.amazon.com/batch/latest/userguide/jobs.html) in the *Batch User Guide*.
    @[JSON::Field(key: "BatchParameters")]
    property batch_parameters : BatchParameters | Nil

    # Contains the message group ID to use when the target is a FIFO queue.
    #
    # If you specify an SQS FIFO queue as a target, the queue must have content-based deduplication
    # enabled.
    @[JSON::Field(key: "SqsParameters")]
    property sqs_parameters : SqsParameters | Nil

    # Contains the HTTP parameters to use when the target is a API Gateway endpoint or EventBridge
    # ApiDestination.
    #
    # If you specify an API Gateway API or EventBridge ApiDestination as a target, you can use this
    # parameter to specify headers, path parameters, and query string keys/values as part of your
    # target invoking request. If you're using ApiDestinations, the corresponding Connection can also
    # have these values configured. In case of any conflicting keys, values from the Connection take
    # precedence.
    @[JSON::Field(key: "HttpParameters")]
    property http_parameters : HttpParameters | Nil

    # Contains the Amazon Redshift Data API parameters to use when the target is a Amazon Redshift
    # cluster.
    #
    # If you specify a Amazon Redshift Cluster as a Target, you can use this to specify parameters to
    # invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge events.
    @[JSON::Field(key: "RedshiftDataParameters")]
    property redshift_data_parameters : RedshiftDataParameters | Nil

    # Contains the SageMaker AI Model Building Pipeline parameters to start execution of a SageMaker
    # AI Model Building Pipeline.
    #
    # If you specify a SageMaker AI Model Building Pipeline as a target, you can use this to specify
    # parameters to start a pipeline execution based on EventBridge events.
    @[JSON::Field(key: "SageMakerPipelineParameters")]
    property sage_maker_pipeline_parameters : SageMakerPipelineParameters | Nil

    # The `DeadLetterConfig` that defines the target queue to send dead-letter queue events to.
    @[JSON::Field(key: "DeadLetterConfig")]
    property dead_letter_config : DeadLetterConfig | Nil

    # The retry policy configuration to use for the dead-letter queue.
    @[JSON::Field(key: "RetryPolicy")]
    property retry_policy : RetryPolicy | Nil

    # Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.
    @[JSON::Field(key: "AppSyncParameters")]
    property app_sync_parameters : AppSyncParameters | Nil

    def initialize(
      @id : String,
      @arn : String,
      @role_arn : String | Nil = nil,
      @input : String | Nil = nil,
      @input_path : String | Nil = nil,
      @input_transformer : InputTransformer | Nil = nil,
      @kinesis_parameters : KinesisParameters | Nil = nil,
      @run_command_parameters : RunCommandParameters | Nil = nil,
      @ecs_parameters : EcsParameters | Nil = nil,
      @batch_parameters : BatchParameters | Nil = nil,
      @sqs_parameters : SqsParameters | Nil = nil,
      @http_parameters : HttpParameters | Nil = nil,
      @redshift_data_parameters : RedshiftDataParameters | Nil = nil,
      @sage_maker_pipeline_parameters : SageMakerPipelineParameters | Nil = nil,
      @dead_letter_config : DeadLetterConfig | Nil = nil,
      @retry_policy : RetryPolicy | Nil = nil,
      @app_sync_parameters : AppSyncParameters | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @id
        raise Core::ValidationError.new("Id length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Id length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("Id does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end

      if value = @arn
        raise Core::ValidationError.new("Arn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Arn length must be <= 1600") if value.size > 1600
      end

      if value = @role_arn
        raise Core::ValidationError.new("RoleArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RoleArn length must be <= 1600") if value.size > 1600
      end

      if value = @input
        raise Core::ValidationError.new("Input length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Input length must be <= 8192") if value.size > 8192
      end

      if value = @input_path
        raise Core::ValidationError.new("InputPath length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("InputPath length must be <= 256") if value.size > 256
      end

      if value = @input_transformer
        value.validate!
      end

      if value = @kinesis_parameters
        value.validate!
      end

      if value = @run_command_parameters
        value.validate!
      end

      if value = @ecs_parameters
        value.validate!
      end

      if value = @batch_parameters
        value.validate!
      end

      if value = @sqs_parameters
        value.validate!
      end

      if value = @http_parameters
        value.validate!
      end

      if value = @redshift_data_parameters
        value.validate!
      end

      if value = @sage_maker_pipeline_parameters
        value.validate!
      end

      if value = @dead_letter_config
        value.validate!
      end

      if value = @retry_policy
        value.validate!
      end

      if value = @app_sync_parameters
        value.validate!
      end
    end

    def_equals_and_hash(@id, @arn, @role_arn, @input, @input_path, @input_transformer, @kinesis_parameters, @run_command_parameters, @ecs_parameters, @batch_parameters, @sqs_parameters, @http_parameters, @redshift_data_parameters, @sage_maker_pipeline_parameters, @dead_letter_config, @retry_policy, @app_sync_parameters)
  end
end
