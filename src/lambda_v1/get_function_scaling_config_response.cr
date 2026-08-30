private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class GetFunctionScalingConfigResponse
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the function.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    # The scaling configuration that is currently applied to the function. This represents the actual
    # scaling settings in effect.
    @[JSON::Field(key: "AppliedFunctionScalingConfig")]
    property applied_function_scaling_config : FunctionScalingConfig | Nil

    # The scaling configuration that was requested for the function.
    @[JSON::Field(key: "RequestedFunctionScalingConfig")]
    property requested_function_scaling_config : FunctionScalingConfig | Nil

    def initialize(
      @function_arn : String | Nil = nil,
      @applied_function_scaling_config : FunctionScalingConfig | Nil = nil,
      @requested_function_scaling_config : FunctionScalingConfig | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @applied_function_scaling_config
        value.validate!
      end

      if value = @requested_function_scaling_config
        value.validate!
      end
    end

    def_equals_and_hash(@function_arn, @applied_function_scaling_config, @requested_function_scaling_config)
  end
end
