module Amazonite::DynamoDBV2
  class ListContributorInsightsInput
    include JSON::Serializable

    # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
    # parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # A token to for the desired page, if there is one.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Maximum number of results to return per page.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end
  end
end
