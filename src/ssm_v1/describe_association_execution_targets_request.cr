module Amazonite::SsmV1
  class DescribeAssociationExecutionTargetsRequest
    include JSON::Serializable

    # The association ID that includes the execution for which you want to view details.
    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    # The execution ID for which you want to view details.
    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String

    # Filters for the request. You can specify the following filters and values.
    #
    # Status (EQUAL)
    #
    # ResourceId (EQUAL)
    #
    # ResourceType (EQUAL)
    @[JSON::Field(key: "Filters")]
    property filters : Array(AssociationExecutionTargetsFilter) | Nil

    # The maximum number of items to return for this call. The call also returns a token that you can
    # specify in a subsequent call to get the next set of results.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # A token to start the list. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_id : String,
      @execution_id : String,
      @filters : Array(AssociationExecutionTargetsFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def_equals_and_hash(@association_id, @execution_id, @filters, @max_results, @next_token)
  end
end
