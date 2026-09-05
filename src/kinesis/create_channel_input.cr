private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class CreateChannelInput
    include JSON::Serializable

    # The name of the channel. The name is unique within your Amazon Web Services account and Amazon
    # Web Services Region.
    @[JSON::Field(key: "ChannelName")]
    property channel_name : String

    # The Amazon Resource Name (ARN) of the IAM role that Amazon Kinesis Data Streams assumes to write
    # records to the destination.
    @[JSON::Field(key: "ServiceExecutionRoleARN")]
    property service_execution_role_arn : String

    # The source stream configuration for the channel. Currently, one stream is supported per channel.
    @[JSON::Field(key: "StreamConfigurationList")]
    property stream_configuration_list : Array(ChannelStreamConfiguration) = [] of ChannelStreamConfiguration

    # The configuration for delivery to a general purpose Amazon S3 bucket. You must specify either
    # `S3DestinationConfiguration` or `S3TablesDestinationConfiguration`, but not both.
    @[JSON::Field(key: "S3DestinationConfiguration")]
    property s3_destination_configuration : S3DestinationConfiguration | Nil

    # The configuration for delivery to streaming tables on Apache Iceberg in Amazon S3 Tables. You
    # must specify either `S3DestinationConfiguration` or `S3TablesDestinationConfiguration`, but not
    # both.
    @[JSON::Field(key: "S3TablesDestinationConfiguration")]
    property s3_tables_destination_configuration : S3TablesDestinationConfiguration | Nil

    # The server-side encryption configuration that uses an Amazon Web Services KMS key to encrypt
    # data delivered to the destination.
    @[JSON::Field(key: "EncryptionConfiguration")]
    property encryption_configuration : ChannelEncryptionConfiguration | Nil

    # A set of key-value pairs to assign to the channel. A tag consists of a required key and an
    # optional value.
    @[JSON::Field(key: "Tags")]
    property tags : Hash(String, String) | Nil

    # The Amazon CloudWatch Logs configuration for the channel.
    @[JSON::Field(key: "LoggingConfiguration")]
    property logging_configuration : ChannelLoggingConfiguration | Nil

    def initialize(
      @channel_name : String,
      @service_execution_role_arn : String,
      @stream_configuration_list : Array(ChannelStreamConfiguration),
      @s3_destination_configuration : S3DestinationConfiguration | Nil = nil,
      @s3_tables_destination_configuration : S3TablesDestinationConfiguration | Nil = nil,
      @encryption_configuration : ChannelEncryptionConfiguration | Nil = nil,
      @tags : Hash(String, String) | Nil = nil,
      @logging_configuration : ChannelLoggingConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @channel_name
        raise Core::ValidationError.new("ChannelName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ChannelName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ChannelName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
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

      if value = @tags
        raise Core::ValidationError.new("Tags must have at least 1 entry(s)") if value.size < 1
        raise Core::ValidationError.new("Tags must have at most 200 entry(s)") if value.size > 200
      end

      if value = @logging_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@channel_name, @service_execution_role_arn, @stream_configuration_list, @s3_destination_configuration, @s3_tables_destination_configuration, @encryption_configuration, @tags, @logging_configuration)
  end
end
