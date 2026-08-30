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
  end
end
