private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents a request to perform a `DeleteItem` operation.
  class Delete
    include JSON::Serializable

    # The primary key of the item to be deleted. Each element consists of an attribute name and a
    # value for that attribute.
    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    # Name of the table in which the item to be deleted resides. You can also provide the Amazon
    # Resource Name (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # A condition that must be satisfied in order for a conditional delete to succeed.
    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String | Nil

    # One or more substitution tokens for attribute names in an expression.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    # Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if the `Delete` condition
    # fails. For `ReturnValuesOnConditionCheckFailure`, the valid values are: NONE and ALL_OLD.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @key : Hash(String, AttributeValue),
      @table_name : String,
      @condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end
  end
end
