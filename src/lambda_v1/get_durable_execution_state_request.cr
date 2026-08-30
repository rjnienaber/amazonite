private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @durable_execution_arn
        raise Core::ValidationError.new("DurableExecutionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DurableExecutionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:([a-zA-Z0-9-]+):lambda:([a-zA-Z0-9-]+):(\\d{12}):function:([a-zA-Z0-9_-]+):(\\$LATEST(?:\\.PUBLISHED)?|[0-9]+)/durable-execution/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)$"))
      end

      if value = @checkpoint_token
        raise Core::ValidationError.new("CheckpointToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("CheckpointToken length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("CheckpointToken does not match the required pattern") unless value.matches?(Regex.new("^[A-Za-z0-9+/]+={0,2}$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 0") if value < 0
        raise Core::ValidationError.new("MaxItems value must be <= 1000") if value > 1000
      end
    end

    def_equals_and_hash(@durable_execution_arn, @checkpoint_token, @marker, @max_items)
  end
end
