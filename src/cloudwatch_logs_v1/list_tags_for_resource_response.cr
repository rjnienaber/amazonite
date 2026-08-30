module Amazonite::CloudWatchLogsV1
  class ListTagsForResourceResponse
    include JSON::Serializable

    # The list of tags associated with the requested resource.>
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
