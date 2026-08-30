module Amazonite::CloudWatchLogsV1
  class DeleteLogStreamRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The name of the log stream.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String

    def initialize(
      @log_group_name : String,
      @log_stream_name : String,
    )
    end

    def_equals_and_hash(@log_group_name, @log_stream_name)
  end
end
