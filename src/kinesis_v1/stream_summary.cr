private alias AK = Amazonite::KinesisV1
private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  # The summary of a stream.
  class StreamSummary
    include JSON::Serializable

    # The name of a stream.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The status of the stream.
    @[JSON::Field(key: "StreamStatus", converter: AK::StreamStatus)]
    property stream_status : StreamStatus

    @[JSON::Field(key: "StreamModeDetails")]
    property stream_mode_details : StreamModeDetails | Nil

    # The timestamp at which the stream was created.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time | Nil

    def initialize(
      @stream_name : String,
      @stream_arn : String,
      @stream_status : StreamStatus,
      @stream_mode_details : StreamModeDetails | Nil = nil,
      @stream_creation_timestamp : Time | Nil = nil,
    )
    end
  end
end
