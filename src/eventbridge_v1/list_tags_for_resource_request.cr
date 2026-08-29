module Amazonite::EventBridgeV1
  class ListTagsForResourceRequest
    include JSON::Serializable

    # The ARN of the EventBridge resource for which you want to view tags.
    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end
  end
end
