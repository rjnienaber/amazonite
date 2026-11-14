private alias Core = Amazonite::Core

module Amazonite::Lambda
  # The customer-managed runtime configuration for your function. Specifies the customer-managed
  # runtime and the runtime alias that your function uses.
  class FunctionRuntimeConfig
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the customer-managed runtime that your function uses.
    @[JSON::Field(key: "RuntimeArn")]
    property runtime_arn : String

    # The name of the customer-managed runtime alias that your function uses. A runtime alias is a
    # name that points to a runtime version.
    @[JSON::Field(key: "RuntimeAlias")]
    property runtime_alias : String

    def initialize(
      @runtime_arn : String,
      @runtime_alias : String,
    )
    end

    def validate! : Nil
      if value = @runtime_arn
        raise Core::ValidationError.new("RuntimeArn length must be >= 48") if value.size < 48
        raise Core::ValidationError.new("RuntimeArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RuntimeArn does not match the required pattern") unless value.matches?(Regex.new("^arn:[a-z-]+:lambda:[a-z0-9-]+:\\d{12}:runtime/.+$"))
      end

      if value = @runtime_alias
        raise Core::ValidationError.new("RuntimeAlias length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("RuntimeAlias length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@runtime_arn, @runtime_alias)
  end
end
