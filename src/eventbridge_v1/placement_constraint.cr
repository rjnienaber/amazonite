private alias AEB = Amazonite::EventBridgeV1

module Amazonite::EventBridgeV1
  # An object representing a constraint on task placement. To learn more, see [Task Placement
  # Constraints](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-placement-constraints.html)
  # in the Amazon Elastic Container Service Developer Guide.
  class PlacementConstraint
    include JSON::Serializable

    # The type of constraint. Use distinctInstance to ensure that each task in a particular group is
    # running on a different container instance. Use memberOf to restrict the selection to a group of
    # valid candidates.
    @[JSON::Field(key: "type", converter: AEB::PlacementConstraintType)]
    property type : PlacementConstraintType | Nil

    # A cluster query language expression to apply to the constraint. You cannot specify an expression
    # if the constraint type is `distinctInstance`. To learn more, see [Cluster Query
    # Language](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cluster-query-language.html)
    # in the Amazon Elastic Container Service Developer Guide.
    @[JSON::Field(key: "expression")]
    property expression : String | Nil

    def initialize(
      @type : PlacementConstraintType | Nil = nil,
      @expression : String | Nil = nil,
    )
    end

    def_equals_and_hash(@type, @expression)
  end
end
