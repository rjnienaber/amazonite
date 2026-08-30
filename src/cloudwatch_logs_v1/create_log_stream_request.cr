module Amazonite::CloudWatchLogsV1
  class CreateLogStreamRequest
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
  end
end
