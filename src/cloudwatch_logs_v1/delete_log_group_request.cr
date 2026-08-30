module Amazonite::CloudWatchLogsV1
  class DeleteLogGroupRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    def initialize(
      @log_group_name : String,
    )
    end

    def_equals_and_hash(@log_group_name)
  end
end
