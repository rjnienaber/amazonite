private alias Core = Amazonite::Core

module Amazonite::KinesisV1
  class UpdateMaxRecordSizeInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the stream for the `MaxRecordSize` update.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    # The maximum record size of a single record in KiB that you can write to, and read from a stream.
    # Specify a value between 1024 and 10240 KiB (1 to 10 MiB). If you specify a value that is out of
    # this range, `UpdateMaxRecordSize` sends back an `ValidationException` message.
    @[JSON::Field(key: "MaxRecordSizeInKiB")]
    property max_record_size_in_ki_b : Int32

    def initialize(
      @max_record_size_in_ki_b : Int32,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
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

      if value = @max_record_size_in_ki_b
        raise Core::ValidationError.new("MaxRecordSizeInKiB value must be >= 1024") if value < 1024
        raise Core::ValidationError.new("MaxRecordSizeInKiB value must be <= 10240") if value > 10240
      end
    end

    def_equals_and_hash(@stream_arn, @stream_id, @max_record_size_in_ki_b)
  end
end
