private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ParameterizedStatement
    include JSON::Serializable

    @[JSON::Field(key: "Statement")]
    property statement : String

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end
  end
end
