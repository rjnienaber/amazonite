private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  class InvocationRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function, version, or alias.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function` (name-only), `my-function:v1` (with alias).
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:my-function`.
    #
    # - **Partial ARN** – `123456789012:function:my-function`.
    #
    # You can append a version number or alias to any of the formats. The length constraint applies
    # only to the full ARN. If you specify only the function name, it is limited to 64 characters in
    # length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # Choose from the following options.
    #
    # - `RequestResponse` (default) – Invoke the function synchronously. Keep the connection open
    # until the function returns a response or times out. The API response includes the function
    # response and additional data.
    #
    # - `Event` – Invoke the function asynchronously. Send events that fail multiple times to the
    # function's dead-letter queue (if one is configured). The API response only includes a status
    # code.
    #
    # - `DryRun` – Validate parameter values and verify that the user or role has permission to invoke
    # the function.
    @[JSON::Field(key: "InvocationType", converter: AL::InvocationType, ignore: true)]
    property invocation_type : InvocationType | Nil

    # Set to `Tail` to include the execution log in the response. Applies to synchronously invoked
    # functions only.
    @[JSON::Field(key: "LogType", converter: AL::LogType, ignore: true)]
    property log_type : LogType | Nil

    # Up to 3,583 bytes of base64-encoded data about the invoking client to pass to the function in
    # the context object. Lambda passes the `ClientContext` object to your function for synchronous
    # invocations only.
    @[JSON::Field(key: "ClientContext", ignore: true)]
    property client_context : String | Nil

    # A unique name for the durable execution. If you invoke a durable function using a name that
    # already exists with the same payload, Lambda returns the existing execution instead of creating
    # a duplicate. If the payload differs, Lambda returns a `DurableExecutionAlreadyStartedException`
    # error.
    #
    # If not specified, Lambda generates a unique identifier automatically. For more information, see
    # [Execution
    # names](https://docs.aws.amazon.com/lambda/latest/dg/durable-execution-idempotency.html#durable-idempotency-execution-names).
    @[JSON::Field(key: "DurableExecutionName", ignore: true)]
    property durable_execution_name : String | Nil

    # The JSON that you want to provide to your Lambda function as input. The maximum payload size is
    # 6 MB for synchronous invocations and 1 MB for asynchronous invocations.
    #
    # You can enter the JSON directly. For example, `--payload '{ "key": "value" }'`. You can also
    # specify a file path. For example, `--payload file://payload.json`.
    @[JSON::Field(key: "Payload")]
    property payload : String | Nil

    # Specify a version or alias to invoke a published version of the function.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # The identifier of the tenant in a multi-tenant Lambda function.
    @[JSON::Field(key: "TenantId", ignore: true)]
    property tenant_id : String | Nil

    def initialize(
      @function_name : String,
      @invocation_type : InvocationType | Nil = nil,
      @log_type : LogType | Nil = nil,
      @client_context : String | Nil = nil,
      @durable_execution_name : String | Nil = nil,
      @payload : String | Nil = nil,
      @qualifier : String | Nil = nil,
      @tenant_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:|(((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?))(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @durable_execution_name
        raise Core::ValidationError.new("DurableExecutionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("DurableExecutionName length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("DurableExecutionName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^\\$(LATEST(\\.PUBLISHED)?)|[a-zA-Z0-9-_$]+$"))
      end

      if value = @tenant_id
        raise Core::ValidationError.new("TenantId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TenantId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("TenantId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9\\._:\\/=+\\-@ ]+$"))
      end
    end

    def_equals_and_hash(@function_name, @invocation_type, @log_type, @client_context, @durable_execution_name, @payload, @qualifier, @tenant_id)
  end
end
