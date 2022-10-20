module Amazonite::DynamoDBv2
  class ListContributorInsightsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil
    )
    end
  end
end