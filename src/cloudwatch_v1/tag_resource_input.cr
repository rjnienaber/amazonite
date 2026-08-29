module Amazonite::CloudWatchV1
  class TagResourceInput
    include JSON::Serializable

    @[JSON::Field(key: "ResourceARN")]
    property resource_arn : String

    @[JSON::Field(key: "Tags")]
    property tags : Array(Tag) = [] of Tag

    def initialize(
      @resource_arn : String,
      @tags : Array(Tag),
    )
    end
  end
end
