private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents a request to perform a `PutItem` operation.
  class Put
    include JSON::Serializable

    # A map of attribute name to attribute values, representing the primary key of the item to be
    # written by `PutItem`. All of the table's primary key attributes must be specified, and their
    # data types must match those of the table's key schema. If any attributes are present in the item
    # that are part of an index key schema for the table, their types must match the index key schema.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue)

    # Name of the table in which to write the item. You can also provide the Amazon Resource Name
    # (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # A condition that must be satisfied in order for a conditional update to succeed.
    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String | Nil

    # One or more substitution tokens for attribute names in an expression.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    # Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if the `Put` condition
    # fails. For `ReturnValuesOnConditionCheckFailure`, the valid values are: NONE and ALL_OLD.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @item : Hash(String, AttributeValue),
      @table_name : String,
      @condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end

    def_equals_and_hash(@item, @table_name, @condition_expression, @expression_attribute_names, @expression_attribute_values, @return_values_on_condition_check_failure)
  end
end
