module Amazonite::CloudWatchLogsV1
  class TagLogGroupRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The key-value pairs to use for the tags.
    @[JSON::Field(key: "tags")]
    property tags : Hash(String, String)

    def initialize(
      @log_group_name : String,
      @tags : Hash(String, String),
    )
    end

    def_equals_and_hash(@log_group_name, @tags)
  end
end
