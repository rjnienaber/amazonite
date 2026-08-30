private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class ListDurableExecutionsByFunctionRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function. You can specify a function name, a partial ARN, or a
    # full ARN.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # The function version or alias. If not specified, lists executions for the $LATEST version.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # Filter executions by name. Only executions with names that matches this string are returned.
    @[JSON::Field(key: "DurableExecutionName", ignore: true)]
    property durable_execution_name : String | Nil

    # Filter executions by status. Valid values: RUNNING, SUCCEEDED, FAILED, TIMED_OUT, STOPPED.
    @[JSON::Field(key: "Statuses", converter: Core::ArrayConverter(AL::ExecutionStatus), ignore: true)]
    property statuses : Array(ExecutionStatus) | Nil

    # Filter executions that started after this timestamp (ISO 8601 format).
    @[JSON::Field(key: "StartedAfter", converter: Core::AWSEpochConverter, ignore: true)]
    property started_after : Time | Nil

    # Filter executions that started before this timestamp (ISO 8601 format).
    @[JSON::Field(key: "StartedBefore", converter: Core::AWSEpochConverter, ignore: true)]
    property started_before : Time | Nil

    # Set to true to return results in chronological order (oldest first). Default is false.
    @[JSON::Field(key: "ReverseOrder", ignore: true)]
    property reverse_order : Bool | Nil

    # Pagination token from a previous request to continue retrieving results.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # Maximum number of executions to return (1-1000). Default is 100.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @function_name : String,
      @qualifier : String | Nil = nil,
      @durable_execution_name : String | Nil = nil,
      @statuses : Array(ExecutionStatus) | Nil = nil,
      @started_after : Time | Nil = nil,
      @started_before : Time | Nil = nil,
      @reverse_order : Bool | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:|(((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?))(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^\\$(LATEST(\\.PUBLISHED)?)|[a-zA-Z0-9-_$]+$"))
      end

      if value = @durable_execution_name
        raise Core::ValidationError.new("DurableExecutionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("DurableExecutionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @statuses
        raise Core::ValidationError.new("Statuses must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Statuses must have at most 10 item(s)") if value.size > 10
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxItems value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@function_name, @qualifier, @durable_execution_name, @statuses, @started_after, @started_before, @reverse_order, @marker, @max_items)
  end
end
