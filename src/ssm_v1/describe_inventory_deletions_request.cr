module Amazonite::SsmV1
  class DescribeInventoryDeletionsRequest
    include JSON::Serializable

    # Specify the delete inventory ID for which you want information. This ID was returned by the
    # `DeleteInventory` operation.
    @[JSON::Field(key: "DeletionId")]
    property deletion_id : String | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    def initialize(
      @deletion_id : String | Nil = nil,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
    )
    end

    def_equals_and_hash(@deletion_id, @next_token, @max_results)
  end
end
