private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class Delete
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @key : Hash(String, AttributeValue),
      @table_name : String,
      @condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil
    )
    end
  end
end