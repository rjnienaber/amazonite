module Amazonite::LambdaV1
  class DeleteFunctionUrlConfigRequest
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

    def initialize(
      @function_name : String,
      @qualifier : String | Nil = nil,
    )
    end
  end
end
