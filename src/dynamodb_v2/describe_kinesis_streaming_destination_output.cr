module Amazonite::DynamoDBV2
  class DescribeKinesisStreamingDestinationOutput
    include JSON::Serializable

    # The name of the table being described.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The list of replica structures for the table being described.
    @[JSON::Field(key: "KinesisDataStreamDestinations")]
    property kinesis_data_stream_destinations : Array(KinesisDataStreamDestination) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @kinesis_data_stream_destinations : Array(KinesisDataStreamDestination) | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @kinesis_data_stream_destinations)
  end
end
