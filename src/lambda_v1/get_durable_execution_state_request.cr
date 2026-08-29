module Amazonite::LambdaV1
  class GetDurableExecutionStateRequest
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    @[JSON::Field(key: "CheckpointToken", ignore: true)]
    property checkpoint_token : String = ""

    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @durable_execution_arn : String,
      @checkpoint_token : String,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end
  end
end
