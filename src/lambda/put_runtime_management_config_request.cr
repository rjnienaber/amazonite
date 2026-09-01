private alias AL = Amazonite::Lambda
private alias Core = Amazonite::Core

module Amazonite::Lambda
  class PutRuntimeManagementConfigRequest
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

    # Specify a version of the function. This can be `$LATEST` or a published version number. If no
    # value is specified, the configuration for the `$LATEST` version is returned.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # Specify the runtime update mode.
    #
    # - **Auto (default)** - Automatically update to the most recent and secure runtime version using
    # a [Two-phase runtime version
    # rollout](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html#runtime-management-two-phase).
    # This is the best choice for most customers to ensure they always benefit from runtime updates.
    #
    # - **Function update** - Lambda updates the runtime of your function to the most recent and
    # secure runtime version when you update your function. This approach synchronizes runtime updates
    # with function deployments, giving you control over when runtime updates are applied and allowing
    # you to detect and mitigate rare runtime update incompatibilities early. When using this setting,
    # you need to regularly update your functions to keep their runtime up-to-date.
    #
    # - **Manual** - You specify a runtime version in your function configuration. The function will
    # use this runtime version indefinitely. In the rare case where a new runtime version is
    # incompatible with an existing function, this allows you to roll back your function to an earlier
    # runtime version. For more information, see [Roll back a runtime
    # version](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html#runtime-management-rollback).
    @[JSON::Field(key: "UpdateRuntimeOn", converter: AL::UpdateRuntimeOn)]
    property update_runtime_on : UpdateRuntimeOn

    # The ARN of the runtime version you want the function to use.
    #
    # This is only required if you're using the **Manual** runtime update mode.
    @[JSON::Field(key: "RuntimeVersionArn")]
    property runtime_version_arn : String | Nil

    def initialize(
      @function_name : String,
      @update_runtime_on : UpdateRuntimeOn,
      @qualifier : String | Nil = nil,
      @runtime_version_arn : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:\\d{12}:|(((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?))(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^\\$(LATEST(\\.PUBLISHED)?)|[a-zA-Z0-9-_$]+$"))
      end

      if value = @runtime_version_arn
        raise Core::ValidationError.new("RuntimeVersionArn length must be >= 26") if value.size < 26
        raise Core::ValidationError.new("RuntimeVersionArn length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("RuntimeVersionArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z-]*):lambda:(eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}::runtime:.+$"))
      end
    end

    def_equals_and_hash(@function_name, @qualifier, @update_runtime_on, @runtime_version_arn)
  end
end
