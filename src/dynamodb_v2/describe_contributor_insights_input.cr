module Amazonite::DynamoDBv2
  class DescribeContributorInsightsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    def initialize(
      @table_name : String,
      @index_name : String | Nil = nil
    )
    end
  end
end
