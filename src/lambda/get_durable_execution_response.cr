private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The response from the GetDurableExecution operation, containing detailed information about the
  # durable execution.
  class GetDurableExecutionResponse
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn")]
    property durable_execution_arn : String

    # The name of the durable execution. This is either the name you provided when invoking the
    # function, or a system-generated unique identifier if no name was provided.
    @[JSON::Field(key: "DurableExecutionName")]
    property durable_execution_name : String

    # The Amazon Resource Name (ARN) of the Lambda function that was invoked to start this durable
    # execution.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    # The JSON input payload that was provided when the durable execution was started. For
    # asynchronous invocations, this is limited to 256 KB. For synchronous invocations, this can be up
    # to 6 MB.
    @[JSON::Field(key: "InputPayload")]
    property input_payload : String | Nil

    # The JSON result returned by the durable execution if it completed successfully. This field is
    # only present when the execution status is `SUCCEEDED`. The result is limited to 256 KB.
    @[JSON::Field(key: "Result")]
    property result : String | Nil

    # Error information if the durable execution failed. This field is only present when the execution
    # status is `FAILED`, `TIMED_OUT`, or `STOPPED`. The combined size of all error fields is limited
    # to 256 KB.
    @[JSON::Field(key: "Error")]
    property error : ErrorObject | Nil

    # The date and time when the durable execution started, in Unix timestamp format.
    @[JSON::Field(key: "StartTimestamp", converter: Core::AWSEpochConverter)]
    property start_timestamp : Time

    # The current status of the durable execution. Valid values are `RUNNING`, `SUCCEEDED`, `FAILED`,
    # `TIMED_OUT`, and `STOPPED`.
    @[JSON::Field(key: "Status", converter: AL::ExecutionStatus)]
    property status : ExecutionStatus

    # The date and time when the durable execution ended, in Unix timestamp format. This field is only
    # present if the execution has completed (status is `SUCCEEDED`, `FAILED`, `TIMED_OUT`, or
    # `STOPPED`).
    @[JSON::Field(key: "EndTimestamp", converter: Core::AWSEpochConverter)]
    property end_timestamp : Time | Nil

    # The version of the Lambda function that was invoked for this durable execution. This ensures
    # that all replays during the execution use the same function version.
    @[JSON::Field(key: "Version")]
    property version : String | Nil

    # The trace headers associated with the durable execution.
    @[JSON::Field(key: "TraceHeader")]
    property trace_header : TraceHeader | Nil

    # Indicates whether execution data is included in this response. Returns `false` when
    # `IncludeExecutionData` is set to `false` in the request.
    @[JSON::Field(key: "ExecutionDataIncluded")]
    property execution_data_included : Bool | Nil

    # Configuration settings for the durable execution, including execution timeout, retention period
    # for execution history, and an optional ARN of the Key Management Service (KMS) customer managed
    # key that is used to encrypt your durable execution's payload data, including input, output, and
    # error payloads.
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

    def validate! : Nil
      if value = @durable_execution_arn
        raise Core::ValidationError.new("DurableExecutionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DurableExecutionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:([a-zA-Z0-9-]+):lambda:([a-zA-Z0-9-]+):(\\d{12}):function:([a-zA-Z0-9_-]+):(\\$LATEST(?:\\.PUBLISHED)?|[0-9]+)/durable-execution/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)$"))
      end

      if value = @durable_execution_name
        raise Core::ValidationError.new("DurableExecutionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("DurableExecutionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_\\.]+(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @input_payload
        raise Core::ValidationError.new("InputPayload length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("InputPayload length must be <= 6291456") if value.size > 6291456
      end

      if value = @result
        raise Core::ValidationError.new("Result length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Result length must be <= 6291456") if value.size > 6291456
      end

      if value = @error
        value.validate!
      end

      if value = @version
        raise Core::ValidationError.new("Version length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Version length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("Version does not match the required pattern") unless value.matches?(Regex.new("^(\\$LATEST(\\.PUBLISHED)?|[0-9]+)$"))
      end

      if value = @trace_header
        value.validate!
      end

      if value = @durable_config
        value.validate!
      end
    end

    def_equals_and_hash(@durable_execution_arn, @durable_execution_name, @function_arn, @input_payload, @result, @error, @start_timestamp, @status, @end_timestamp, @version, @trace_header, @execution_data_included, @durable_config)
  end
end
