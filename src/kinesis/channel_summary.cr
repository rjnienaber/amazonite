private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # A summary of a channel, returned by ListChannels.
  class ChannelSummary
    include JSON::Serializable

    # The name of the channel.
    @[JSON::Field(key: "ChannelName")]
    property channel_name : String

    # The Amazon Resource Name (ARN) of the channel.
    @[JSON::Field(key: "ChannelARN")]
    property channel_arn : String

    # The unique identifier of the channel.
    @[JSON::Field(key: "ChannelId")]
    property channel_id : String

    # The current status of the channel. Valid values:
    #
    # - `CREATING` - The channel is being created.
    #
    # - `ACTIVE` - The channel is ready to deliver records.
    #
    # - `UPDATING` - The channel configuration is being updated.
    #
    # - `DELETING` - The channel is being deleted.
    #
    # - `FAILED` - See `ChannelStatusReason` for the failure cause.
    @[JSON::Field(key: "ChannelStatus", converter: AK::ChannelStatus)]
    property channel_status : ChannelStatus

    # A message describing the reason for a `FAILED` status.
    @[JSON::Field(key: "ChannelStatusReason")]
    property channel_status_reason : String | Nil

    # The time at which the channel was created.
    @[JSON::Field(key: "ChannelCreationTimestamp", converter: Core::AWSEpochConverter)]
    property channel_creation_timestamp : Time

    # The destination type of the channel. Valid values:
    #
    # - `S3` - Delivery to a general purpose Amazon S3 bucket.
    #
    # - `S3_TABLES` - Delivery to streaming tables on Apache Iceberg.
    @[JSON::Field(key: "ChannelDestinationType", converter: AK::ChannelDestinationType)]
    property channel_destination_type : ChannelDestinationType

    # The source streams associated with the channel.
    @[JSON::Field(key: "Streams")]
    property streams : Array(ChannelStreamIdentifier) = [] of ChannelStreamIdentifier

    def initialize(
      @channel_name : String,
      @channel_arn : String,
      @channel_id : String,
      @channel_status : ChannelStatus,
      @channel_creation_timestamp : Time,
      @channel_destination_type : ChannelDestinationType,
      @streams : Array(ChannelStreamIdentifier),
      @channel_status_reason : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @channel_name
        raise Core::ValidationError.new("ChannelName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ChannelName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @channel_arn
        raise Core::ValidationError.new("ChannelARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ChannelARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:channel/\\S+$"))
      end

      if value = @channel_id
        raise Core::ValidationError.new("ChannelId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelId length must be <= 64") if value.size > 64
      end

      if value = @channel_status_reason
        raise Core::ValidationError.new("ChannelStatusReason length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelStatusReason length must be <= 2048") if value.size > 2048
      end

      if value = @streams
        raise Core::ValidationError.new("Streams must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Streams must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@channel_name, @channel_arn, @channel_id, @channel_status, @channel_status_reason, @channel_creation_timestamp, @channel_destination_type, @streams)
  end
end
