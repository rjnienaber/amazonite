module Amazonite::KinesisV1
  # Represents the input for DecreaseStreamRetentionPeriod.
  class DecreaseStreamRetentionPeriodInput
    include JSON::Serializable

    # The name of the stream to modify.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The new retention period of the stream, in hours. Must be less than the current retention
    # period.
    @[JSON::Field(key: "RetentionPeriodHours")]
    property retention_period_hours : Int32

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @retention_period_hours : Int32,
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
