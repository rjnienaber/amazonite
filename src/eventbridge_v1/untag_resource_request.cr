private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 1600") if value.size > 1600
      end
    end

    def_equals_and_hash(@resource_arn, @tag_keys)
  end
end
