module Amazonite::LambdaV1
  class GetDurableExecutionRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    # Specifies whether to include execution data such as input payload, result, and error information
    # in the response. Set to `false` for a more compact response that includes only execution
    # metadata. The default value is set to `true`.
    @[JSON::Field(key: "IncludeExecutionData", ignore: true)]
    property include_execution_data : Bool | Nil

    def initialize(
      @durable_execution_arn : String,
      @include_execution_data : Bool | Nil = nil,
    )
    end
  end
end
