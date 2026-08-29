module Amazonite::EventBridgeV1
  class TagResourceRequest
    include JSON::Serializable

    # The ARN of the EventBridge resource that you're adding tags to.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    # The list of key-value pairs to associate with the resource.
    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resource_arn : String,
      @tags : Array(Tag),
    )
    end
  end
end
