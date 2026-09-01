private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @code_signing_config_arn
        raise Core::ValidationError.new("CodeSigningConfigArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CodeSigningConfigArn length must be <= 200") if value.size > 200
        raise Core::ValidationError.new("CodeSigningConfigArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:code-signing-config:csc-[a-z0-9]{17}$"))
      end

      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end
    end

    def_equals_and_hash(@code_signing_config_arn, @function_name)
  end
end
