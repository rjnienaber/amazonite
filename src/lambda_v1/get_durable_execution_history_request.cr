module Amazonite::LambdaV1
  class GetDurableExecutionHistoryRequest
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    @[JSON::Field(key: "IncludeExecutionData", ignore: true)]
    property include_execution_data : Bool | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "ReverseOrder", ignore: true)]
    property reverse_order : Bool | Nil

    def initialize(
      @durable_execution_arn : String,
      @include_execution_data : Bool | Nil = nil,
      @max_items : Int32 | Nil = nil,
      @marker : String | Nil = nil,
      @reverse_order : Bool | Nil = nil,
    )
    end
  end
end
