private alias Core = Amazonite::Core

module Amazonite::Lambda
  class InvocationResponse
    include JSON::Serializable

    # The HTTP status code is in the 200 range for a successful request. For the `RequestResponse`
    # invocation type, this status code is 200. For the `Event` invocation type, this status code is
    # 202. For the `DryRun` invocation type, the status code is 204.
    @[JSON::Field(key: "StatusCode", ignore: true)]
    property status_code : Int32 | Nil

    # If present, indicates that an error occurred during function execution. Details about the error
    # are included in the response payload.
    @[JSON::Field(key: "FunctionError", ignore: true)]
    property function_error : String | Nil

    # The last 4 KB of the execution log, which is base64-encoded.
    @[JSON::Field(key: "LogResult", ignore: true)]
    property log_result : String | Nil

    # The response from the function, or an error object.
    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    # The version of the function that executed. When you invoke a function with an alias, this
    # indicates which version the alias resolved to.
    @[JSON::Field(key: "ExecutedVersion", ignore: true)]
    property executed_version : String | Nil

    # The ARN of the durable execution that was started. This is returned when invoking a durable
    # function and provides a unique identifier for tracking the execution.
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

    def validate! : Nil
      if value = @executed_version
        raise Core::ValidationError.new("ExecutedVersion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExecutedVersion length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("ExecutedVersion does not match the required pattern") unless value.matches?(Regex.new("^(\\$LATEST|[0-9]+)$"))
      end

      if value = @durable_execution_arn
        raise Core::ValidationError.new("DurableExecutionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DurableExecutionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:([a-zA-Z0-9-]+):lambda:([a-zA-Z0-9-]+):(\\d{12}):function:([a-zA-Z0-9_-]+):(\\$LATEST(?:\\.PUBLISHED)?|[0-9]+)/durable-execution/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)$"))
      end
    end

    def_equals_and_hash(@status_code, @function_error, @log_result, @payload, @executed_version, @durable_execution_arn)
  end
end
