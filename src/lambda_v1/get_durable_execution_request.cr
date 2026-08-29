module Amazonite::LambdaV1
  class GetDurableExecutionRequest
    include JSON::Serializable

    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    @[JSON::Field(key: "IncludeExecutionData", ignore: true)]
    property include_execution_data : Bool | Nil

    def initialize(
      @durable_execution_arn : String,
      @include_execution_data : Bool | Nil = nil,
    )
    end
  end
end
