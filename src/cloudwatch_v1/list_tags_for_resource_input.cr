module Amazonite::CloudWatchV1
  class ListTagsForResourceInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    def initialize(
      @resource_arn : String,
    )
    end
  end
end
