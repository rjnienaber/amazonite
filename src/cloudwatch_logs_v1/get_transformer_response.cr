private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class GetTransformerResponse
    include JSON::Serializable

    # The ARN of the log group that you specified in your request.
    @[JSON::Field(key: "logGroupIdentifier")]
    property log_group_identifier : String | Nil

    # The creation time of the transformer, expressed as the number of milliseconds after Jan 1, 1970
    # 00:00:00 UTC.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The date and time when this transformer was most recently modified, expressed as the number of
    # milliseconds after Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "lastModifiedTime")]
    property last_modified_time : Int64 | Nil

    # This sructure contains the configuration of the requested transformer.
    @[JSON::Field(key: "transformerConfig")]
    property transformer_config : Array(Processor) | Nil

    def initialize(
      @log_group_identifier : String | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @last_modified_time : Int64 | Nil = nil,
      @transformer_config : Array(Processor) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @log_group_identifier
        raise Core::ValidationError.new("logGroupIdentifier length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("logGroupIdentifier length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("logGroupIdentifier does not match the required pattern") unless value.matches?(Regex.new("^[\\w#+=/:,.@-]*$"))
      end

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @last_modified_time
        raise Core::ValidationError.new("lastModifiedTime value must be >= 0") if value < 0
      end

      if value = @transformer_config
        raise Core::ValidationError.new("transformerConfig must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("transformerConfig must have at most 20 item(s)") if value.size > 20
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@log_group_identifier, @creation_time, @last_modified_time, @transformer_config)
  end
end
