private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class TestTransformerRequest
    include JSON::Serializable

    # This structure contains the configuration of this log transformer that you want to test. A log
    # transformer is an array of processors, where each processor applies one type of transformation
    # to the log events that are ingested.
    @[JSON::Field(key: "transformerConfig")]
    property transformer_config : Array(Processor) = [] of Processor

    # An array of the raw log events that you want to use to test this transformer.
    @[JSON::Field(key: "logEventMessages")]
    property log_event_messages : Array(String) = [] of String

    def initialize(
      @transformer_config : Array(Processor),
      @log_event_messages : Array(String),
    )
    end

    def validate! : Nil
      if value = @transformer_config
        raise Core::ValidationError.new("transformerConfig must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("transformerConfig must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end

      if value = @log_event_messages
        raise Core::ValidationError.new("logEventMessages must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("logEventMessages must have at most 50 item(s)") if value.size > 50
      end
    end

    def_equals_and_hash(@transformer_config, @log_event_messages)
  end
end
