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
  end
end
