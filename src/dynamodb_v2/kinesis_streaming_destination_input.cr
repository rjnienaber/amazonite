module Amazonite::DynamoDBv2
  class KinesisStreamingDestinationInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "StreamArn")]
    property stream_arn : String

    def initialize(
      @table_name : String,
      @stream_arn : String
    )
    end
  end
end