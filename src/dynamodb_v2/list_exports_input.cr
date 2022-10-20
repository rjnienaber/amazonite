module Amazonite::DynamoDBv2
  class ListExportsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @table_arn : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end