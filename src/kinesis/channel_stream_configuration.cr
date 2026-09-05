private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Specifies the source stream and record configuration when creating a channel.
  class ChannelStreamConfiguration
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the source Kinesis data stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # The record format configuration for the source stream.
    @[JSON::Field(key: "RecordConfiguration")]
    property record_configuration : RecordConfiguration

    def initialize(
      @stream_arn : String,
      @record_configuration : RecordConfiguration,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @record_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@stream_arn, @record_configuration)
  end
end
