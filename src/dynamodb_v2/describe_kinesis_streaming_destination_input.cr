module Amazonite::DynamoDBv2
  class DescribeKinesisStreamingDestinationInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    def initialize(
      @table_name : String
    )
    end
  end
end