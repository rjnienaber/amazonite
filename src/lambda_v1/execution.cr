private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Information about a [durable
  # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html).
  class Execution
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution, if this execution is a durable
    # execution.
    @[JSON::Field(key: "DurableExecutionArn")]
    property durable_execution_arn : String

    # The unique name of the durable execution, if one was provided when the execution was started.
    @[JSON::Field(key: "DurableExecutionName")]
    property durable_execution_name : String

    # The Amazon Resource Name (ARN) of the Lambda function.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    # The current status of the durable execution.
    @[JSON::Field(key: "Status", converter: AL::ExecutionStatus)]
    property status : ExecutionStatus

    # The date and time when the durable execution started, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    # The date and time when the durable execution ended, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time | Nil

    # The ARN of the Key Management Service (KMS) customer managed key that is used to encrypt your
    # durable execution's payload data, including input, output, and error payloads.
    @[JSON::Field(key: "KMSKeyArn")]
    property kms_key_arn : String | Nil

    def initialize(
      @durable_execution_arn : String,
      @durable_execution_name : String,
      @function_arn : String,
      @status : ExecutionStatus,
      @start_timestamp : Time,
      @end_timestamp : Time | Nil = nil,
      @kms_key_arn : String | Nil = nil,
    )
    end

    def_equals_and_hash(@durable_execution_arn, @durable_execution_name, @function_arn, @status, @start_timestamp, @end_timestamp, @kms_key_arn)
  end
end
