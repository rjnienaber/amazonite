private alias Core = Amazonite::Core

module Amazonite::Kinesis
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

    def validate! : Nil
      if value = @records
        raise Core::ValidationError.new("Records must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Records must have at most 500 item(s)") if value.size > 500
        value.each(&.validate!)
      end

      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@records, @stream_name, @stream_arn, @stream_id)
  end
end
