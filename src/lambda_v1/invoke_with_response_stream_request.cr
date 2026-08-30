private alias AL = Amazonite::LambdaV1

module Amazonite::LambdaV1
  class InvokeWithResponseStreamRequest
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

    # Set to `Tail` to include the execution log in the response. Applies to synchronously invoked
    # functions only.
    @[JSON::Field(key: "LogType", converter: AL::LogType, ignore: true)]
    property log_type : LogType | Nil

    # Up to 3,583 bytes of base64-encoded data about the invoking client to pass to the function in
    # the context object.
    @[JSON::Field(key: "ClientContext", ignore: true)]
    property client_context : String | Nil

    # The alias name.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # The JSON that you want to provide to your Lambda function as input.
    #
    # You can enter the JSON directly. For example, `--payload '{ "key": "value" }'`. You can also
    # specify a file path. For example, `--payload file://payload.json`.
    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    # The identifier of the tenant in a multi-tenant Lambda function.
    @[JSON::Field(key: "TenantId", ignore: true)]
    property tenant_id : String | Nil

    # Use one of the following options:
    #
    # - `RequestResponse` (default) – Invoke the function synchronously. Keep the connection open
    # until the function returns a response or times out. The API operation response includes the
    # function response and additional data.
    #
    # - `DryRun` – Validate parameter values and verify that the IAM user or role has permission to
    # invoke the function.
    @[JSON::Field(key: "InvocationType", converter: AL::ResponseStreamingInvocationType, ignore: true)]
    property invocation_type : ResponseStreamingInvocationType | Nil

    def initialize(
      @function_name : String,
      @log_type : LogType | Nil = nil,
      @client_context : String | Nil = nil,
      @qualifier : String | Nil = nil,
      @payload : String | Nil = nil,
      @tenant_id : String | Nil = nil,
      @invocation_type : ResponseStreamingInvocationType | Nil = nil,
    )
    end

    def_equals_and_hash(@function_name, @log_type, @client_context, @qualifier, @payload, @tenant_id, @invocation_type)
  end
end
