private alias Core = Amazonite::Core

module Amazonite::Lambda
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

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @statement_id
        raise Core::ValidationError.new("StatementId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatementId length must be <= 100") if value.size > 100
        raise Core::ValidationError.new("StatementId does not match the required pattern") unless value.matches?(Regex.new("^([a-zA-Z0-9-_.]+)$"))
      end

      if value = @qualifier
        raise Core::ValidationError.new("Qualifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Qualifier length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Qualifier does not match the required pattern") unless value.matches?(Regex.new("^\\$(LATEST(\\.PUBLISHED)?)|[a-zA-Z0-9-_$]+$"))
      end
    end

    def_equals_and_hash(@function_name, @statement_id, @qualifier, @revision_id)
  end
end
