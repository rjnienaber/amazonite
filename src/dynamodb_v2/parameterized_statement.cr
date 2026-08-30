private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents a PartiQL statement that uses parameters.
  class ParameterizedStatement
    include JSON::Serializable

    # A PartiQL statement that uses parameters.
    @[JSON::Field(key: "Statement")]
    property statement : String

    # The parameter values.
    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    # An optional parameter that returns the item attributes for a PartiQL `ParameterizedStatement`
    # operation that failed a condition check.
    #
    # There is no additional cost associated with requesting a return value aside from the small
    # network and processing overhead of receiving a larger response. No read capacity units are
    # consumed.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end

    def_equals_and_hash(@statement, @parameters, @return_values_on_condition_check_failure)
  end
end
