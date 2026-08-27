private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ExecuteStatementInput
    include JSON::Serializable

    @[JSON::Field(key: "Statement")]
    property statement : String

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @next_token : String | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @limit : Int32 | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end
  end
end
