private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @table_arn
        raise Core::ValidationError.new("TableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableArn length must be <= 1024") if value.size > 1024
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 25") if value > 25
      end
    end

    def_equals_and_hash(@table_arn, @max_results, @next_token)
  end
end
