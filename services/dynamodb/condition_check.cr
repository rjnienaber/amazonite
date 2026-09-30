private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents a request to perform a check that an item exists or to check the condition of
  # specific attributes of the item.
  class ConditionCheck
    include JSON::Serializable

    # The primary key of the item to be checked. Each element consists of an attribute name and a
    # value for that attribute.
    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    # Name of the table for the check item request. You can also provide the Amazon Resource Name
    # (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # A condition that must be satisfied in order for a conditional update to succeed. For more
    # information, see [Condition
    # expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String

    # One or more substitution tokens for attribute names in an expression. For more information, see
    # [Expression attribute
    # names](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ExpressionAttributeNames.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression. For more information, see
    # [Condition
    # expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    # Use `ReturnValuesOnConditionCheckFailure` to get the item attributes if the `ConditionCheck`
    # condition fails. For `ReturnValuesOnConditionCheckFailure`, the valid values are: NONE and
    # ALL_OLD.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @key : Hash(String, AttributeValue),
      @table_name : String,
      @condition_expression : String,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @key
        value.each_value(&.validate!)
      end

      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @expression_attribute_values
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@key, @table_name, @condition_expression, @expression_attribute_names, @expression_attribute_values, @return_values_on_condition_check_failure)
  end
end
