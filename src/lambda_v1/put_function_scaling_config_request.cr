module Amazonite::LambdaV1
  class PutFunctionScalingConfigRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # Specify a version or alias to set the scaling configuration for a published version of the
    # function.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    # The scaling configuration to apply to the function, including minimum and maximum execution
    # environment limits.
    @[JSON::Field(key: "FunctionScalingConfig")]
    property function_scaling_config : FunctionScalingConfig | Nil

    def initialize(
      @function_name : String,
      @qualifier : String,
      @function_scaling_config : FunctionScalingConfig | Nil = nil,
    )
    end

    def_equals_and_hash(@function_name, @qualifier, @function_scaling_config)
  end
end
