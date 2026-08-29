module Amazonite::LambdaV1
  class GetFunctionScalingConfigResponse
    include JSON::Serializable

    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String | Nil

    @[JSON::Field(key: "AppliedFunctionScalingConfig")]
    property applied_function_scaling_config : FunctionScalingConfig | Nil

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
