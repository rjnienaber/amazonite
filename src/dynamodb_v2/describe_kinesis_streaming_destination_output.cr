module Amazonite::DynamoDBV2
  class DescribeKinesisStreamingDestinationOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "KinesisDataStreamDestinations")]
    property kinesis_data_stream_destinations : Array(KinesisDataStreamDestination) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @kinesis_data_stream_destinations : Array(KinesisDataStreamDestination) | Nil = nil
    )
    end
  end
end
