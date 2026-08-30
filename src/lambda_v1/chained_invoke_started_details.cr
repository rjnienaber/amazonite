private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Contains details about a chained function invocation that has started execution, including start
  # time and execution context.
  class ChainedInvokeStartedDetails
    include JSON::Serializable

    # The name or ARN of the Lambda function being invoked.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    # The tenant identifier for the chained invocation.
    @[JSON::Field(key: "TenantId")]
    property tenant_id : String | Nil

    # The JSON input payload provided to the chained invocation.
    @[JSON::Field(key: "Input")]
    property input : EventInput | Nil

    # The version of the function that was executed.
    @[JSON::Field(key: "ExecutedVersion")]
    property executed_version : String | Nil

    # The Amazon Resource Name (ARN) that identifies the durable execution.
    @[JSON::Field(key: "DurableExecutionArn")]
    property durable_execution_arn : String | Nil

    def initialize(
      @function_name : String,
      @tenant_id : String | Nil = nil,
      @input : EventInput | Nil = nil,
      @executed_version : String | Nil = nil,
      @durable_execution_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:|(((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?))(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @tenant_id
        raise Core::ValidationError.new("TenantId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TenantId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TenantId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\._:\\/=+\\-@ ]+$"))
      end

      if value = @input
        value.validate!
      end

      if value = @executed_version
        raise Core::ValidationError.new("ExecutedVersion length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExecutedVersion length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("ExecutedVersion does not match the required pattern") unless value.matches?(Regex.new("^(\\$LATEST(\\.PUBLISHED)?|[0-9]+)$"))
      end

      if value = @durable_execution_arn
        raise Core::ValidationError.new("DurableExecutionArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionArn length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("DurableExecutionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:([a-zA-Z0-9-]+):lambda:([a-zA-Z0-9-]+):(\\d{12}):function:([a-zA-Z0-9_-]+):(\\$LATEST(?:\\.PUBLISHED)?|[0-9]+)/durable-execution/([a-zA-Z0-9_-]+)/([a-zA-Z0-9_-]+)$"))
      end
    end

    def_equals_and_hash(@function_name, @tenant_id, @input, @executed_version, @durable_execution_arn)
  end
end
