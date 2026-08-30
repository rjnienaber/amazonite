private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 1600") if value.size > 1600
      end
    end

    def_equals_and_hash(@resource_arn)
  end
end
