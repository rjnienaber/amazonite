module Amazonite::CloudWatchLogsV1
  class ListTagsLogGroupRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    def initialize(
      @log_group_name : String,
    )
    end
  end
end
