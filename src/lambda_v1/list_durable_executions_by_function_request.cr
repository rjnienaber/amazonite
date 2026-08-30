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
  end
end
