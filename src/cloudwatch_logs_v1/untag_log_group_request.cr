module Amazonite::CloudWatchLogsV1
  class UntagLogGroupRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The tag keys. The corresponding tags are removed from the log group.
    @[JSON::Field(key: "tags")]
    property tags : Array(String) = [] of String

    def initialize(
      @log_group_name : String,
      @tags : Array(String),
    )
    end

    def_equals_and_hash(@log_group_name, @tags)
  end
end
