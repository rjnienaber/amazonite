module Amazonite::LambdaV1
  class PutFunctionScalingConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    @[JSON::Field(key: "FunctionScalingConfig")]
    property function_scaling_config : FunctionScalingConfig | Nil

    def initialize(
      @function_name : String,
      @qualifier : String,
      @function_scaling_config : FunctionScalingConfig | Nil = nil,
    )
    end
  end
end
