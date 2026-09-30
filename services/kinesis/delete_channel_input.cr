private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class DeleteChannelInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the channel to delete.
    @[JSON::Field(key: "ChannelARN")]
    property channel_arn : String

    def initialize(
      @channel_arn : String,
    )
    end

    def validate! : Nil
      if value = @channel_arn
        raise Core::ValidationError.new("ChannelARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ChannelARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:channel/\\S+$"))
      end
    end

    def_equals_and_hash(@channel_arn)
  end
end
