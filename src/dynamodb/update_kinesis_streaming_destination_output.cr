private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class UpdateKinesisStreamingDestinationOutput
    include JSON::Serializable

    # The table name for the Kinesis streaming destination output.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The ARN for the Kinesis stream input.
    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String | Nil

    # The status of the attempt to update the Kinesis streaming destination output.
    @[JSON::Field(key: "DestinationStatus", converter: ADDB::DestinationStatus)]
    property destination_status : DestinationStatus | Nil

    # The command to update the Kinesis streaming destination configuration.
    @[JSON::Field(key: "UpdateKinesisStreamingConfiguration")]
    property update_kinesis_streaming_configuration : UpdateKinesisStreamingConfiguration | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @destination_status : DestinationStatus | Nil = nil,
      @update_kinesis_streaming_configuration : UpdateKinesisStreamingConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("StreamArn length must be <= 1024") if value.size > 1024
      end

      if value = @update_kinesis_streaming_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@table_name, @stream_arn, @destination_status, @update_kinesis_streaming_configuration)
  end
end
