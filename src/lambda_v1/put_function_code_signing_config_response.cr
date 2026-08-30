module Amazonite::LambdaV1
  class PutFunctionCodeSigningConfigResponse
    include JSON::Serializable

    # The The Amazon Resource Name (ARN) of the code signing configuration.
    @[JSON::Field(key: "CodeSigningConfigArn")]
    property code_signing_config_arn : String

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** - `MyFunction`.
    #
    # - **Function ARN** - `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
    #
    # - **Partial ARN** - `123456789012:function:MyFunction`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName")]
    property function_name : String

    def initialize(
      @code_signing_config_arn : String,
      @function_name : String,
    )
    end

    def_equals_and_hash(@code_signing_config_arn, @function_name)
  end
end
