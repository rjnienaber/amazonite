private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @resource_arn
        raise Core::ValidationError.new("ResourceARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ResourceARN length must be <= 1600") if value.size > 1600
      end

      if value = @tags
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@resource_arn, @tags)
  end
end
