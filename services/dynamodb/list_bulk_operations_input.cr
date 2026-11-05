private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class ListBulkOperationsInput
    include JSON::Serializable

    # The maximum number of bulk operation summaries to return in one page. If you don't specify a
    # value, DynamoDB uses 10.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # An optional string that, if supplied, must be copied from the output of a previous call to
    # `ListBulkOperations`. When provided in this manner, the API fetches the next page of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 25") if value > 25
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1024") if value.size > 1024
        raise Core::ValidationError.new("NextToken does not match the required pattern") unless value.matches?(Regex.new("^([0-9a-f]{16})+$"))
      end
    end

    def_equals_and_hash(@max_results, @next_token)
  end
end
