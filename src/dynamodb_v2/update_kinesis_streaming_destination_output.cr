private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
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
  end
end
