module Amazonite::LambdaV1
  class GetDurableExecutionStateRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    # A checkpoint token that identifies the current state of the execution. This token is provided by
    # the Lambda runtime and ensures that state retrieval is consistent with the current execution
    # context.
    @[JSON::Field(key: "CheckpointToken", ignore: true)]
    property checkpoint_token : String = ""

    # If `NextMarker` was returned from a previous request, use this value to retrieve the next page
    # of operations. Each pagination token expires after 24 hours.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of operations to return per call. You can use `Marker` to retrieve additional
    # pages of results. The default is 100 and the maximum allowed is 1000. A value of 0 uses the
    # default.
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
