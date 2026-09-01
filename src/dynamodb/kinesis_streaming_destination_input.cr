private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class KinesisStreamingDestinationInput
    include JSON::Serializable

    # The name of the DynamoDB table. You can also provide the Amazon Resource Name (ARN) of the table
    # in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The ARN for a Kinesis data stream.
    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String

    # The source for the Kinesis streaming information that is being enabled.
    @[JSON::Field(key: "EnableKinesisStreamingConfiguration")]
    property enable_kinesis_streaming_configuration : EnableKinesisStreamingConfiguration | Nil

    def initialize(
      @table_name : String,
      @stream_arn : String,
      @enable_kinesis_streaming_configuration : EnableKinesisStreamingConfiguration | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamArn length must be >= 37") if value.size < 37
        raise Core::ValidationError.new("StreamArn length must be <= 1024") if value.size > 1024
      end

      if value = @enable_kinesis_streaming_configuration
        value.validate!
      end
    end

    def_equals_and_hash(@table_name, @stream_arn, @enable_kinesis_streaming_configuration)
  end
end
