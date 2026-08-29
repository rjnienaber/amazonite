private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class KinesisStreamingDestinationOutput
    include JSON::Serializable

    # The name of the table being modified.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The ARN for the specific Kinesis data stream.
    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String | Nil

    # The current status of the replication.
    @[JSON::Field(key: "DestinationStatus", converter: ADDB::DestinationStatus)]
    property destination_status : DestinationStatus | Nil

    # The destination for the Kinesis streaming information that is being enabled.
    @[JSON::Field(key: "EnableKinesisStreamingConfiguration")]
    property enable_kinesis_streaming_configuration : EnableKinesisStreamingConfiguration | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @stream_arn : String | Nil = nil,
      @destination_status : DestinationStatus | Nil = nil,
      @enable_kinesis_streaming_configuration : EnableKinesisStreamingConfiguration | Nil = nil,
    )
    end
  end
end
