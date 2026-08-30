private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @transformer_config
        raise Core::ValidationError.new("transformerConfig must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("transformerConfig must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@log_group_identifier, @transformer_config)
  end
end
