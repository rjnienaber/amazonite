module Amazonite::CloudWatchLogsV1
  class PutTransformerRequest
    include JSON::Serializable

    # Specify either the name or ARN of the log group to create the transformer for.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String

    # This structure contains the configuration of this log transformer. A log transformer is an array
    # of processors, where each processor applies one type of transformation to the log events that
    # are ingested.
    @[JSON::Field(key: "transformerConfig")]
    property transformer_config : Array(Processor) = [] of Processor

    def initialize(
      @log_group_identifier : String,
      @transformer_config : Array(Processor),
    )
    end
  end
end
