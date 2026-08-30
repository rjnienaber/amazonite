private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  # Configuration options for chained function invocations in durable executions, including retry
  # settings and timeout configuration.
  class ChainedInvokeOptions
    include JSON::Serializable

    # The name or ARN of the Lambda function to invoke.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    # The tenant identifier for the chained invocation.
    @[JSON::Field(key: "TenantId")]
    property tenant_id : String | Nil

    def initialize(
      @function_name : String,
      @tenant_id : String | Nil = nil,
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
    end

    def_equals_and_hash(@function_name, @tenant_id)
  end
end
