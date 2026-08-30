private alias AL = Amazonite::LambdaV1

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

    def_equals_and_hash(@function_url, @function_arn, @auth_type, @cors, @creation_time, @last_modified_time, @invoke_mode)
  end
end
