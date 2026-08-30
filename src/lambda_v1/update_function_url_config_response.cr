private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class UpdateFunctionUrlConfigResponse
    include JSON::Serializable

    # The HTTP URL endpoint for your function.
    @[JSON::Field(key: "FunctionUrl")]
    property function_url : String

    # The Amazon Resource Name (ARN) of your function.
    @[JSON::Field(key: "FunctionArn")]
    property function_arn : String

    # The type of authentication that your function URL uses. Set to `AWS_IAM` if you want to restrict
    # access to authenticated users only. Set to `NONE` if you want to bypass IAM authentication to
    # create a public endpoint. For more information, see [Control access to Lambda function
    # URLs](https://docs.aws.amazon.com/lambda/latest/dg/urls-auth.html).
    @[JSON::Field(key: "AuthType", converter: AL::FunctionUrlAuthType)]
    property auth_type : FunctionUrlAuthType

    # The [cross-origin resource sharing
    # (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) settings for your function URL.
    @[JSON::Field(key: "Cors")]
    property cors : Cors | Nil

    # When the function URL was created, in [ISO-8601 format](https://www.w3.org/TR/NOTE-datetime)
    # (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "CreationTime")]
    property creation_time : String

    # When the function URL configuration was last updated, in [ISO-8601
    # format](https://www.w3.org/TR/NOTE-datetime) (YYYY-MM-DDThh:mm:ss.sTZD).
    @[JSON::Field(key: "LastModifiedTime")]
    property last_modified_time : String

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
      @function_url : String,
      @function_arn : String,
      @auth_type : FunctionUrlAuthType,
      @creation_time : String,
      @last_modified_time : String,
      @cors : Cors | Nil = nil,
      @invoke_mode : InvokeMode | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_url
        raise Core::ValidationError.new("FunctionUrl length must be >= 40") if value.size < 40
        raise Core::ValidationError.new("FunctionUrl length must be <= 100") if value.size > 100
      end

      if value = @function_arn
        raise Core::ValidationError.new("FunctionArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("FunctionArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("FunctionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:function:[a-zA-Z0-9-_]+(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @cors
        value.validate!
      end

      if value = @creation_time
        raise Core::ValidationError.new("CreationTime length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("CreationTime length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("CreationTime does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end

      if value = @last_modified_time
        raise Core::ValidationError.new("LastModifiedTime length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("LastModifiedTime length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("LastModifiedTime does not match the required pattern") unless value.matches?(Regex.new("^.*$"))
      end
    end

    def_equals_and_hash(@function_url, @function_arn, @auth_type, @cors, @creation_time, @last_modified_time, @invoke_mode)
  end
end
