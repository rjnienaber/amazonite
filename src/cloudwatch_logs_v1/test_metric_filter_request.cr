module Amazonite::CloudWatchLogsV1
  class TestMetricFilterRequest
    include JSON::Serializable

    @[JSON::Field(key: "filterPattern")]
    property filter_pattern : String

    # The log event messages to test.
    @[JSON::Field(key: "logEventMessages")]
    property log_event_messages : Array(String) = [] of String

    def initialize(
      @filter_pattern : String,
      @log_event_messages : Array(String),
    )
    end
  end
end
