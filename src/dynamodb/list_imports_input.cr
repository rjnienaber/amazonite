private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @table_arn
        raise Core::ValidationError.new("TableArn length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableArn length must be <= 1024") if value.size > 1024
      end

      if value = @page_size
        raise Core::ValidationError.new("PageSize value must be >= 1") if value < 1
        raise Core::ValidationError.new("PageSize value must be <= 25") if value > 25
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 112") if value.size < 112
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("NextToken does not match the required pattern") unless value.matches?(Regex.new("^([0-9a-f]{16})+$"))
      end
    end

    def_equals_and_hash(@table_arn, @page_size, @next_token)
  end
end
