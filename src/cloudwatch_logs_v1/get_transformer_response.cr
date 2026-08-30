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
  end
end
