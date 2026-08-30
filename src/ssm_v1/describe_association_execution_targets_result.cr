private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeAssociationExecutionTargetsResult
    include JSON::Serializable

    # Information about the execution.
    @[JSON::Field(key: "AssociationExecutionTargets")]
    property association_execution_targets : Array(AssociationExecutionTarget) | Nil

    # The token for the next set of items to return. Use this token to get the next set of results.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_execution_targets : Array(AssociationExecutionTarget) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @association_execution_targets
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@association_execution_targets, @next_token)
  end
end
