private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class KinesisStreamingDestinationOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String | Nil

    @[JSON::Field(key: "DestinationStatus", converter: ADDB::DestinationStatus)]
    property destination_status : DestinationStatus | Nil

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
