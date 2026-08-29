module Amazonite::EventBridgeV1
  class UntagResourceRequest
    include JSON::Serializable

    # The ARN of the EventBridge resource from which you are removing tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # The list of tag keys to remove from the resource.
    @[JSON::Field(key: "TagKeys")]
    property tag_keys : Array(String) = [] of String

    def initialize(
      @resource_arn : String,
      @tag_keys : Array(String),
    )
    end
  end
end
