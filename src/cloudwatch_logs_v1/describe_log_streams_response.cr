private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_streams
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@log_streams, @next_token)
  end
end
