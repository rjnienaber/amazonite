module Amazonite::LambdaV1
  class PutFunctionCodeSigningConfigRequest
    include JSON::Serializable

    @[JSON::Field(key: "CodeSigningConfigArn")]
    property code_signing_config_arn : String

    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    def initialize(
      @code_signing_config_arn : String,
      @function_name : String,
    )
    end
  end
end
