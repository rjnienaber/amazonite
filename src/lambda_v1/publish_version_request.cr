private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class PublishVersionRequest
    include JSON::Serializable

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** - `MyFunction`.
    #
    # - **Function ARN** - `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
    #
    # - **Partial ARN** - `123456789012:function:MyFunction`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it is
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String = ""

    # Only publish a version if the hash value matches the value that's specified. Use this option to
    # avoid publishing a version if the function code has changed since you last updated it. You can
    # get the hash for the version that you uploaded from the output of UpdateFunctionCode.
    @[JSON::Field(key: "CodeSha256")]
    property code_sha_256 : String | Nil

    # A description for the version to override the description in the function configuration.
    @[JSON::Field(key: "Description")]
    property description : String | Nil

    # Only update the function if the revision ID matches the ID that's specified. Use this option to
    # avoid publishing a version if the function configuration has changed since you last updated it.
    @[JSON::Field(key: "RevisionId")]
    property revision_id : String | Nil

    # Specifies where to publish the function version or configuration.
    @[JSON::Field(key: "PublishTo", converter: AL::FunctionVersionLatestPublished)]
    property publish_to : FunctionVersionLatestPublished | Nil

    def initialize(
      @function_name : String,
      @code_sha_256 : String | Nil = nil,
      @description : String | Nil = nil,
      @revision_id : String | Nil = nil,
      @publish_to : FunctionVersionLatestPublished | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 140") if value.size > 140
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\\$LATEST|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @description
        raise Core::ValidationError.new("Description length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("Description length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@function_name, @code_sha_256, @description, @revision_id, @publish_to)
  end
end
