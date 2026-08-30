module Amazonite::CloudWatchLogsV1
  class PutLogEventsRequest
    include JSON::Serializable

    # The name of the log group.
    @[JSON::Field(key: "logGroupName")]
    property log_group_name : String

    # The name of the log stream.
    @[JSON::Field(key: "logStreamName")]
    property log_stream_name : String

    # The log events.
    @[JSON::Field(key: "logEvents")]
    property log_events : Array(InputLogEvent) = [] of InputLogEvent

    # The sequence token obtained from the response of the previous `PutLogEvents` call.
    #
    # The `sequenceToken` parameter is now ignored in `PutLogEvents` actions. `PutLogEvents` actions
    # are now accepted and never return `InvalidSequenceTokenException` or
    # `DataAlreadyAcceptedException` even if the sequence token is not valid.
    @[JSON::Field(key: "sequenceToken")]
    property sequence_token : String | Nil

    # The entity associated with the log events.
    @[JSON::Field(key: "entity")]
    property entity : Entity | Nil

    def initialize(
      @log_group_name : String,
      @log_stream_name : String,
      @log_events : Array(InputLogEvent),
      @sequence_token : String | Nil = nil,
      @entity : Entity | Nil = nil,
    )
    end

    def_equals_and_hash(@log_group_name, @log_stream_name, @log_events, @sequence_token, @entity)
  end
end
