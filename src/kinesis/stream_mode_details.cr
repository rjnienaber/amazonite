private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis
  # Data Streams, you can choose between an **on-demand** capacity mode and a **provisioned**
  # capacity mode for your data streams.
  class StreamModeDetails
    include JSON::Serializable

    # Specifies the capacity mode to which you want to set your data stream. Currently, in Kinesis
    # Data Streams, you can choose between an **on-demand** capacity mode and a **provisioned**
    # capacity mode for your data streams.
    @[JSON::Field(key: "StreamMode", converter: AK::StreamMode)]
    property stream_mode : StreamMode

    def initialize(
      @stream_mode : StreamMode,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@stream_mode)
  end
end
