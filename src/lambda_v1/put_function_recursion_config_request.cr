private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class PutFunctionRecursionConfigRequest
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

    # If you set your function's recursive loop detection configuration to `Allow`, Lambda doesn't
    # take any action when it detects your function being invoked as part of a recursive loop. We
    # recommend that you only use this setting if your design intentionally uses a Lambda function to
    # write data back to the same Amazon Web Services resource that invokes it.
    #
    # If you set your function's recursive loop detection configuration to `Terminate`, Lambda stops
    # your function being invoked and notifies you when it detects your function being invoked as part
    # of a recursive loop.
    #
    # By default, Lambda sets your function's configuration to `Terminate`.
    #
    # If your design intentionally uses a Lambda function to write data back to the same Amazon Web
    # Services resource that invokes the function, then use caution and implement suitable guard rails
    # to prevent unexpected charges being billed to your Amazon Web Services account. To learn more
    # about best practices for using recursive invocation patterns, see [Recursive patterns that cause
    # run-away Lambda
    # functions](https://serverlessland.com/content/service/lambda/guides/aws-lambda-operator-guide/recursive-runaway)
    # in Serverless Land.
    @[JSON::Field(key: "RecursiveLoop", converter: AL::RecursiveLoop)]
    property recursive_loop : RecursiveLoop

    def initialize(
      @function_name : String,
      @recursive_loop : RecursiveLoop,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)$"))
      end
    end

    def_equals_and_hash(@function_name, @recursive_loop)
  end
end
