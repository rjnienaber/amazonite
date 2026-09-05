private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class UpdateChannelInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the channel to update.
    @[JSON::Field(key: "ChannelARN")]
    property channel_arn : String

    # The updated configuration for a general purpose Amazon S3 destination. Only
    # `DataFreshnessInSeconds` can be updated.
    @[JSON::Field(key: "S3DestinationConfiguration")]
    property s3_destination_configuration : S3DestinationUpdateInput | Nil

    # The updated configuration for a streaming table destination. Only `DataFreshnessInSeconds` can
    # be updated.
    @[JSON::Field(key: "S3TablesDestinationConfiguration")]
    property s3_tables_destination_configuration : S3TablesDestinationUpdateInput | Nil

    # The updated Amazon CloudWatch Logs configuration for the channel.
    @[JSON::Field(key: "LoggingConfiguration")]
    property logging_configuration : ChannelLoggingUpdateInput | Nil

    def initialize(
      @channel_arn : String,
      @s3_destination_configuration : S3DestinationUpdateInput | Nil = nil,
      @s3_tables_destination_configuration : S3TablesDestinationUpdateInput | Nil = nil,
      @logging_configuration : ChannelLoggingUpdateInput | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @channel_arn
        raise Core::ValidationError.new("ChannelARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("ChannelARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:channel/\\S+$"))
      end

      if value = @s3_destination_configuration
        value.validate!
      end

      if value = @s3_tables_destination_configuration
        value.validate!
      end

      if value = @logging_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@channel_arn, @s3_destination_configuration, @s3_tables_destination_configuration, @logging_configuration)
  end
end
