private alias Core = Amazonite::Core

module Amazonite::Lambda
  class PauseDurableExecutionRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the durable execution.
    @[JSON::Field(key: "DurableExecutionArn", ignore: true)]
    property durable_execution_arn : String = ""

    # A unique, case-sensitive identifier that you provide so that the request completes no more than
    # one time. If you repeat a request with the same client token and parameters within 15 minutes,
    # Lambda doesn't pause the execution again and returns a successful response instead of an error.
    @[JSON::Field(key: "ClientToken")]
    property client_token : String | Nil

    # A description of why you're pausing the execution. Lambda records the reason in the execution
    # history.
    @[JSON::Field(key: "Reason")]
    property reason : String | Nil

    # Specifies whether to pause the execution timeout while the execution is paused. If `true`,
    # Lambda extends the execution timeout by the time the execution spends paused. An execution with
    # a paused timeout still times out 366 days after it started. The default value is `true`.
    @[JSON::Field(key: "ExecutionTimeoutPaused")]
    property execution_timeout_paused : Bool | Nil

    def initialize(
      @durable_execution_arn : String,
      @client_token : String | Nil = nil,
      @reason : String | Nil = nil,
      @execution_timeout_paused : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @durable_execution_arn
        raise Core::ValidationError.new("DurableExecutionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DurableExecutionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:([a-zA-Z0-9-]+):lambda:([a-zA-Z0-9-]+):(\\d{12}):function:([a-zA-Z0-9_-]+):(\\$LATEST(?:\\.PUBLISHED)?|[0-9]+)/durable-execution/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)$"))
      end

      if value = @client_token
        raise Core::ValidationError.new("ClientToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ClientToken length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("ClientToken does not match the required pattern") unless value.matches?(Regex.new("^[\\x21-\\x7E]+$"))
      end

      if value = @reason
        raise Core::ValidationError.new("Reason length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Reason length must be <= 1024") if value.size > 1024
      end
    end

    def_equals_and_hash(@durable_execution_arn, @client_token, @reason, @execution_timeout_paused)
  end
end
