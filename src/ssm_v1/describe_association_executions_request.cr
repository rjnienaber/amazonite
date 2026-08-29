module Amazonite::SsmV1
  class DescribeAssociationExecutionsRequest
    include JSON::Serializable

    # The association ID for which you want to view execution history details.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    # Filters for the request. You can specify the following filters and values.
    #
    # ExecutionId (EQUAL)
    #
    # Status (EQUAL)
    #
    # CreatedTime (EQUAL, GREATER_THAN, LESS_THAN)
    @[JSON::Field(key: "Filters")]
    property filters : Array(AssociationExecutionFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_id : String,
      @filters : Array(AssociationExecutionFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
