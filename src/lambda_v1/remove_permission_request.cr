module Amazonite::LambdaV1
  class RemovePermissionRequest
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

    # Statement ID of the permission to remove.
    @[JSON::Field(key: "StatementId", ignore: true)]
    property statement_id : String = ""

    # Specify a version or alias to remove permissions from a published version of the function.
    @[JSON::Field(key: "Qualifier", ignore: true)]
    property qualifier : String | Nil

    # Update the policy only if the revision ID matches the ID that's specified. Use this option to
    # avoid modifying a policy that has changed since you last read it.
    @[JSON::Field(key: "RevisionId", ignore: true)]
    property revision_id : String | Nil

    def initialize(
      @function_name : String,
      @statement_id : String,
      @qualifier : String | Nil = nil,
      @revision_id : String | Nil = nil,
    )
    end
  end
end
