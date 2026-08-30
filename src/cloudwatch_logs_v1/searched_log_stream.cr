private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # Represents the search status of a log stream.
  class SearchedLogStream
    include JSON::Serializable

    # The name of the log stream.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String | Nil

    # Indicates whether all the events in this log stream were searched.
    @[JSON::Field(key: "searchedCompletely")]
    property searched_completely : Bool | Nil

    def initialize(
      @log_stream_name : String | Nil = nil,
      @searched_completely : Bool | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_stream_name
        raise Core::ValidationError.new("logStreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logStreamName length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("logStreamName does not match the required pattern") unless value.matches?(Regex.new("^[^:*]*$"))
      end
    end

    def_equals_and_hash(@log_stream_name, @searched_completely)
  end
end
