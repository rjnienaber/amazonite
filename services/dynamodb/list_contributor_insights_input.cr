private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be <= 100") if value > 100
      end
    end

    def_equals_and_hash(@table_name, @next_token, @max_results)
  end
end
