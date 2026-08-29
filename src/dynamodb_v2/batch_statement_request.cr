private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # A PartiQL batch statement request.
  class BatchStatementRequest
    include JSON::Serializable

    # A valid PartiQL statement.
    @[JSON::Field(key: "Statement")]
    property statement : String

    # The parameters associated with a PartiQL statement in the batch request.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    # The read consistency of the PartiQL batch request.
    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    # An optional parameter that returns the item attributes for a PartiQL batch request operation
    # that failed a condition check.
    #
    # There is no additional cost associated with requesting a return value aside from the small
    # network and processing overhead of receiving a larger response. No read capacity units are
    # consumed.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end
  end
end
