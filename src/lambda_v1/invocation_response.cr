module Amazonite::LambdaV1
  class InvocationResponse
    include JSON::Serializable

    @[JSON::Field(key: "StatusCode", ignore: true)]
    property status_code : Int32 | Nil

    @[JSON::Field(key: "FunctionError", ignore: true)]
    property function_error : String | Nil

    @[JSON::Field(key: "LogResult", ignore: true)]
    property log_result : String | Nil

    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    @[JSON::Field(key: "ExecutedVersion", ignore: true)]
    property executed_version : String | Nil

    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String | Nil

    def initialize(
      @status_code : Int32 | Nil = nil,
      @function_error : String | Nil = nil,
      @log_result : String | Nil = nil,
      @payload : String | Nil = nil,
      @executed_version : String | Nil = nil,
      @durable_execution_arn : String | Nil = nil,
    )
    end
  end
end
