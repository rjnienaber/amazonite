module Amazonite::SsmV1
  class DescribeAssociationExecutionsResult
    include JSON::Serializable

    @[JSON::Field(key: "AssociationExecutions")]
    property association_executions : Array(AssociationExecution) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_executions : Array(AssociationExecution) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
