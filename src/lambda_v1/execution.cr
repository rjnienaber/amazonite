private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class Execution
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn")]
    property durable_execution_arn : String

    @[JSON::Field(key: "DurableExecutionName")]
    property durable_execution_name : String

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    @[JSON::Field(key: "Status", converter: AL::ExecutionStatus)]
    property status : ExecutionStatus

    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time | Nil

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
  end
end
