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
  end
end
