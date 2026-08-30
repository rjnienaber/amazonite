private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @filter_pattern
        raise Core::ValidationError.new("filterPattern length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("filterPattern length must be <= 1024") if value.size > 1024
      end

      if value = @log_event_messages
        raise Core::ValidationError.new("logEventMessages must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logEventMessages must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@filter_pattern, @log_event_messages)
  end
end
