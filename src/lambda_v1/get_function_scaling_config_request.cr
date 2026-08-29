module Amazonite::LambdaV1
  class GetFunctionScalingConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    def initialize(
      @function_name : String,
      @qualifier : String,
    )
    end
  end
end
