module Amazonite::ApiGatewayV1
  # Removes a tag from a given resource.
  class UntagResourceRequest
    include JSON::Serializable

    # The ARN of a resource that can be tagged.
    @[JSON::Field(key: "resourceArn", ignore: true)]
    property resource_arn : String = ""

    # The Tag keys to delete.
    @[JSON::Field(key: "tagKeys", ignore: true)]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String),
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
