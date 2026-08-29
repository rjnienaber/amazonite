private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class ListDurableExecutionsByFunctionRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    @[JSON::Field(key: "DurableExecutionName", ignore: true)]
    property durable_execution_name : String | Nil

    @[JSON::Field(key: "Statuses", converter: Core::ArrayConverter(AL::ExecutionStatus), ignore: true)]
    property statuses : Array(ExecutionStatus) | Nil

    @[JSON::Field(key: "StartedAfter", converter: Core::AWSEpochConverter, ignore: true)]
    property started_after : Time | Nil

    @[JSON::Field(key: "StartedBefore", converter: Core::AWSEpochConverter, ignore: true)]
    property started_before : Time | Nil

    @[JSON::Field(key: "ReverseOrder", ignore: true)]
    property reverse_order : Bool | Nil

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

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
