module Amazonite::DynamoDBV2
  class ListExportsInput
    include JSON::Serializable

    # The Amazon Resource Name (ARN) associated with the exported table.
    @[JSON::Field(key: "TableArn")]
    property table_arn : String | Nil

    # Maximum number of results to return per page.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # An optional string that, if supplied, must be copied from the output of a previous call to
    # `ListExports`. When provided in this manner, the API fetches the next page of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @table_arn : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@table_arn, @max_results, @next_token)
  end
end
