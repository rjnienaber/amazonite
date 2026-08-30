private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @kinesis_data_stream_destinations
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@table_name, @kinesis_data_stream_destinations)
  end
end
