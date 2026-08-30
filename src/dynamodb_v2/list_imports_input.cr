module Amazonite::DynamoDBV2
  class ListImportsInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the table that was imported to.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # The number of `ImportSummary `objects returned in a single page.
    @[JSON::Field(key: "PageSize")]
    property page_size : Int32 | Nil

    # An optional string that, if supplied, must be copied from the output of a previous call to
    # `ListImports`. When provided in this manner, the API fetches the next page of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @table_arn : String | Nil = nil,
      @page_size : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@table_arn, @page_size, @next_token)
  end
end
