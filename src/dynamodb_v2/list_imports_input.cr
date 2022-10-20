module Amazonite::DynamoDBv2
  class ListImportsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    @[JSON::Field(key: "PageSize")]
    property page_size : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @table_arn : String | Nil = nil,
      @page_size : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end