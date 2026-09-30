private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ListOpsItemRelatedItemsRequest
    include JSON::Serializable

    # The ID of the OpsItem for which you want to list all related-item resources.
    @[JSON::Field(key: "OpsItemId")]
    property ops_item_id : String | Nil

    # One or more OpsItem filters. Use a filter to return a more specific list of results.
    @[JSON::Field(key: "Filters")]
    property filters : Array(OpsItemRelatedItemsFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # The token for the next set of items to return. (You received this token from a previous call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @ops_item_id : String | Nil = nil,
      @filters : Array(OpsItemRelatedItemsFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @ops_item_id
        raise Core::ValidationError.new("OpsItemId does not match the required pattern") unless value.matches?(Regex.new("^(oi)-[0-9a-f]{12}$"))
      end

      if value = @filters
        value.each(&.validate!)
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 50") if value > 50
      end
    end

    def_equals_and_hash(@ops_item_id, @filters, @max_results, @next_token)
  end
end
