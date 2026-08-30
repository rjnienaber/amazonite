module Amazonite::CloudWatchLogsV1
  class ListTagsLogGroupResponse
    include JSON::Serializable

    # The tags for the log group.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String) | Nil

    def initialize(
      @tags : Hash(String, String) | Nil = nil,
    )
    end
  end
end
