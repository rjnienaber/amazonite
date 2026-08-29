module Amazonite::DynamoDBV2
  class DescribeContributorInsightsInput
    include JSON::Serializable

    # The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the
    # table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The name of the global secondary index to describe, if applicable.
    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    def initialize(
      @table_name : String,
      @index_name : String | Nil = nil,
    )
    end
  end
end
