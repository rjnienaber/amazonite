module Amazonite::ApiGateway
  # Adds or updates a tag on a given resource.
  class TagResourceRequest
    include JSON::Serializable

    # The ARN of a resource that can be tagged.
    @[JSON::Field(key: "resourceArn", ignore: true)]
    property resource_arn : String = ""

    # The key-value map of strings. The valid character set is [a-zA-Z+-=._:/]. The tag key can be up
    # to 128 characters and must not start with `aws:`. The tag value can be up to 256 characters.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String)

    def initialize(
      @resource_arn : String,
      @tags : Hash(String, String),
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_arn, @tags)
  end
end
