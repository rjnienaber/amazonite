module Amazonite::LambdaV1
  class DeleteFunctionRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function or version.
    #
    # **Name formats**
    #
    # - **Function name** – `my-function` (name-only), `my-function:1` (with version).
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

    # Specify a version to delete. You can't delete a version that an alias references.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    def initialize(
      @function_name : String,
      @qualifier : String | Nil = nil,
    )
    end
  end
end
