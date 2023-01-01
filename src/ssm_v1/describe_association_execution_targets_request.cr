module Amazonite::SsmV1
  class DescribeAssociationExecutionTargetsRequest
    include JSON::Serializable

    @[JSON::Field(key: "AssociationId")]
    property association_id : String

    @[JSON::Field(key: "ExecutionId")]
    property execution_id : String

    @[JSON::Field(key: "Filters")]
    property filters : Array(AssociationExecutionTargetsFilter) | Nil

    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @association_id : String,
      @execution_id : String,
      @filters : Array(AssociationExecutionTargetsFilter) | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
