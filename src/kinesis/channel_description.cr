private alias AK = Amazonite::Kinesis
private alias Core = Amazonite::Core

module Amazonite::Kinesis
  # Describes the configuration and current status of a channel.
  class ChannelDescription
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

    # The Amazon Resource Name (ARN) of the IAM role that Amazon Kinesis Data Streams assumes to write
    # records to the destination.
    @[JSON::Field(key: "ServiceExecutionRoleARN")]
    property service_execution_role_arn : String

    # The source stream configuration for the channel.
    @[JSON::Field(key: "StreamConfigurationList")]
    property stream_configuration_list : Array(ChannelStreamDescription) = [] of ChannelStreamDescription

    # The configuration for delivery to a general purpose Amazon S3 bucket. Present only when the
    # channel destination is a general purpose Amazon S3 bucket.
    @[JSON::Field(key: "S3DestinationConfiguration")]
    property s3_destination_configuration : S3DestinationDescription | Nil

    # The configuration for delivery to streaming tables on Apache Iceberg in Amazon S3 Tables.
    # Present only when the channel destination is a streaming table.
    @[JSON::Field(key: "S3TablesDestinationConfiguration")]
    property s3_tables_destination_configuration : S3TablesDestinationDescription | Nil

    # The server-side encryption configuration for the channel.
    @[JSON::Field(key: "EncryptionConfiguration")]
    property encryption_configuration : ChannelEncryptionConfiguration | Nil

    # The Amazon CloudWatch Logs configuration for the channel.
    @[JSON::Field(key: "LoggingConfiguration")]
    property logging_configuration : ChannelLoggingConfiguration

    def initialize(
      @channel_name : String,
      @channel_arn : String,
      @channel_id : String,
      @channel_status : ChannelStatus,
      @channel_creation_timestamp : Time,
      @service_execution_role_arn : String,
      @stream_configuration_list : Array(ChannelStreamDescription),
      @logging_configuration : ChannelLoggingConfiguration,
      @channel_status_reason : String | Nil = nil,
      @s3_destination_configuration : S3DestinationDescription | Nil = nil,
      @s3_tables_destination_configuration : S3TablesDestinationDescription | Nil = nil,
      @encryption_configuration : ChannelEncryptionConfiguration | Nil = nil,
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

      if value = @service_execution_role_arn
        raise Core::ValidationError.new("ServiceExecutionRoleARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ServiceExecutionRoleARN length must be <= 512") if value.size > 512
        raise Core::ValidationError.new("ServiceExecutionRoleARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws[-a-z0-9]*:iam::\\d{12}:role/[a-zA-Z_0-9+=,.@\\-_/]+$"))
      end

      if value = @stream_configuration_list
        raise Core::ValidationError.new("StreamConfigurationList must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("StreamConfigurationList must have at most 10000 item(s)") if value.size > 10000
        value.each(&.validate!)
      end

      if value = @s3_destination_configuration
        value.validate!
      end

      if value = @s3_tables_destination_configuration
        value.validate!
      end

      if value = @encryption_configuration
        value.validate!
      end

      if value = @logging_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@channel_name, @channel_arn, @channel_id, @channel_status, @channel_status_reason, @channel_creation_timestamp, @service_execution_role_arn, @stream_configuration_list, @s3_destination_configuration, @s3_tables_destination_configuration, @encryption_configuration, @logging_configuration)
  end
end
