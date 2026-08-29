module Amazonite::LambdaV1
  class GetFunctionScalingConfigRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # Specify a version or alias to get the scaling configuration for a published version of the
    # function.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String = ""

    def initialize(
      @function_name : String,
      @qualifier : String,
    )
    end
  end
end
