module Amazonite::SsmV1
  class DescribeAssociationExecutionTargetsResult
    include JSON::Serializable

    @[JSON::Field(key: "AssociationExecutionTargets")]
    property association_execution_targets : Array(AssociationExecutionTarget) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_execution_targets : Array(AssociationExecutionTarget) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
