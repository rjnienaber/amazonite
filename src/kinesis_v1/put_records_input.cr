module Amazonite::KinesisV1
  # A `PutRecords` request.
  class PutRecordsInput
    include JSON::Serializable

    # The records associated with the request.
    @[JSON::Field(key: "Records")]
    property records : Array(PutRecordsRequestEntry) = [] of PutRecordsRequestEntry

    # The stream name associated with the request.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @records : Array(PutRecordsRequestEntry),
      @stream_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end
  end
end
