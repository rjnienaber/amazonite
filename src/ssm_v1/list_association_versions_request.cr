module Amazonite::SsmV1
  class ListAssociationVersionsRequest
    include JSON::Serializable

    # The association ID for which you want to view all versions.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_id : String,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@association_id, @max_results, @next_token)
  end
end
