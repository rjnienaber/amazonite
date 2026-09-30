private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @durable_execution_arn
        raise Core::ValidationError.new("DurableExecutionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DurableExecutionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:([a-zA-Z0-9-]+):lambda:([a-zA-Z0-9-]+):(\\d{12}):function:([a-zA-Z0-9_-]+):(\\$LATEST(?:\\.PUBLISHED)?|[0-9]+)/durable-execution/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)$"))
      end
    end

    def_equals_and_hash(@durable_execution_arn, @include_execution_data)
  end
end
