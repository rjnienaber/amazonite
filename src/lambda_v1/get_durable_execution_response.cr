private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetDurableExecutionResponse
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn")]
    property durable_execution_arn : String

    @[JSON::Field(key: "DurableExecutionName")]
    property durable_execution_name : String

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    @[JSON::Field(key: "InputPayload")]
    property input_payload : String | Nil

    @[JSON::Field(key: "Result")]
    property result : String | Nil

    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    @[JSON::Field(key: "Status", converter: AL::ExecutionStatus)]
    property status : ExecutionStatus

    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time | Nil

    @[JSON::Field(key: "Version")]
    property version : String | Nil

    @[JSON::Field(key: "TraceHeader")]
    property trace_header : TraceHeader | Nil

    @[JSON::Field(key: "ExecutionDataIncluded")]
    property execution_data_included : Bool | Nil

    @[JSON::Field(key: "DurableConfig")]
    property durable_config : DurableConfig | Nil

    def initialize(
      @durable_execution_arn : String,
      @durable_execution_name : String,
      @function_arn : String,
      @start_timestamp : Time,
      @status : ExecutionStatus,
      @input_payload : String | Nil = nil,
      @result : String | Nil = nil,
      @error : ErrorObject | Nil = nil,
      @end_timestamp : Time | Nil = nil,
      @version : String | Nil = nil,
      @trace_header : TraceHeader | Nil = nil,
      @execution_data_included : Bool | Nil = nil,
      @durable_config : DurableConfig | Nil = nil,
    )
    end
  end
end
