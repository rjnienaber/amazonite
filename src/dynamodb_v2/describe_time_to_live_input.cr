module Amazonite::DynamoDBv2
  class DescribeTimeToLiveInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    def initialize(
      @table_name : String
    )
    end
  end
end
