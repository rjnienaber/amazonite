module Amazonite::CloudWatchLogsV1
  class DescribeLogStreamsResponse
    include JSON::Serializable

    # The log streams.
    @[JSON::Field(key: "logStreams")]
    property log_streams : Array(LogStream) | Nil

    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @log_streams : Array(LogStream) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
