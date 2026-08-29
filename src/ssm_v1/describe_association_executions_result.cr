module Amazonite::SsmV1
  class DescribeAssociationExecutionsResult
    include JSON::Serializable

    # A list of the executions for the specified association ID.
    @[JSON::Field(key: "AssociationExecutions")]
    property association_executions : Array(AssociationExecution) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_executions : Array(AssociationExecution) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
