private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateFunctionUrlConfigRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function`.
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** – `123456789012:function:my-function`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # The alias name.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # The type of authentication that your function URL uses. Set to `AWS_IAM` if you want to restrict
    # access to authenticated users only. Set to `NONE` if you want to bypass IAM authentication to
    # create a public endpoint. For more information, see [Control access to Lambda function
    # URLs](https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html).
    @[JSON::Field(key: "AuthType", converter: AL::FunctionUrlAuthType)]
    property auth_type : FunctionUrlAuthType | Nil

    # The [cross-origin resource sharing
    # (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) settings for your function URL.
    @[JSON::Field(key: "Cors")]
    property cors : Cors | Nil

    # Use one of the following options:
    #
    # - `BUFFERED` – This is the default option. Lambda invokes your function using the `Invoke` API
    # operation. Invocation results are available when the payload is complete. The maximum payload
    # size is 6 MB.
    #
    # - `RESPONSE_STREAM` – Your function streams payload results as they become available. Lambda
    # invokes your function using the `InvokeWithResponseStream` API operation. The maximum response
    # payload size is 200 MB.
    @[JSON::Field(key: "InvokeMode", converter: AL::InvokeMode)]
    property invoke_mode : InvokeMode | Nil

    def initialize(
      @function_name : String,
      @qualifier : String | Nil = nil,
      @auth_type : FunctionUrlAuthType | Nil = nil,
      @cors : Cors | Nil = nil,
      @invoke_mode : InvokeMode | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]{1,64})(:((?!\\d+$)[0-9a-zA-Z-_]+))?$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^((?!^\\d+$)^[0-9a-zA-Z-_]+$)$"))
      end

      if value = @cors
        value.validate!
      end
    end

    def_equals_and_hash(@function_name, @qualifier, @auth_type, @cors, @invoke_mode)
  end
end
