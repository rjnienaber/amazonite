private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class CreateChannelOutput
    include JSON::Serializable

    # The configuration and current status of the channel, including its ARN, destination
    # configuration, and lifecycle state. Immediately after creation, the state is `CREATING`.
    @[JSON::Field(key: "ChannelDescription")]
    property channel_description : ChannelDescription

    def initialize(
      @channel_description : ChannelDescription,
    )
    end

    def validate! : Nil
      if value = @channel_description
        value.validate!
      end
    end

    def_equals_and_hash(@channel_description)
  end
end
