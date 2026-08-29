private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the input of a `PutItem` operation.
  class PutItemInput
    include JSON::Serializable

    # The name of the table to contain the item. You can also provide the Amazon Resource Name (ARN)
    # of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # A map of attribute name/value pairs, one for each attribute. Only the primary key attributes are
    # required; you can optionally provide other attribute name-value pairs for the item.
    #
    # You must provide all of the attributes for the primary key. For example, with a simple primary
    # key, you only need to provide a value for the partition key. For a composite primary key, you
    # must provide both values for both the partition key and the sort key.
    #
    # If you specify any attributes that are part of an index key, then the data types for those
    # attributes must match those of the schema in the table's attribute definition.
    #
    # If the table has vector indexes, the following validations apply to write operations. A
    # violation of any of these constraints results in a `ValidationException`:
    #
    # - The vector attribute must be a list of numbers with dimensions matching the index
    # configuration.
    #
    # - Vector values must fit in 32-bit IEEE-754 floating point format (f32).
    #
    # - Partition key and inline filter attributes defined in the search schema must have data types
    # matching the index schema definition.
    #
    # Empty String and Binary attribute values are allowed. Attribute values of type String and Binary
    # must have a length greater than zero if the attribute is used as a key attribute for a table or
    # index.
    #
    # For more information about primary keys, see [Primary
    # Key](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/HowItWorks.CoreComponents.html#HowItWorks.CoreComponents.PrimaryKey)
    # in the *Amazon DynamoDB Developer Guide*.
    #
    # Each element in the `Item` map is an `AttributeValue` object.
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue)

    # This is a legacy parameter. Use `ConditionExpression` instead. For more information, see
    # [Expected](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.Expected.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "Expected")]
    property expected : Hash(String, ExpectedAttributeValue) | Nil

    # Use `ReturnValues` if you want to get the item attributes as they appeared before they were
    # updated with the `PutItem` request. For `PutItem`, the valid values are:
    #
    # - `NONE` - If `ReturnValues` is not specified, or if its value is `NONE`, then nothing is
    # returned. (This setting is the default for `ReturnValues`.)
    #
    # - `ALL_OLD` - If `PutItem` overwrote an attribute name-value pair, then the content of the old
    # item is returned.
    #
    # The values returned are strongly consistent.
    #
    # There is no additional cost associated with requesting a return value aside from the small
    # network and processing overhead of receiving a larger response. No read capacity units are
    # consumed.
    #
    # The `ReturnValues` parameter is used by several DynamoDB operations; however, `PutItem` does not
    # recognize any values other than `NONE` or `ALL_OLD`.
    @[JSON::Field(key: "ReturnValues", converter: ADDB::ReturnValue)]
    property return_values : ReturnValue | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # Determines whether item collection metrics are returned. If set to `SIZE`, the response includes
    # statistics about item collections, if any, that were modified during the operation are returned
    # in the response. If set to `NONE` (the default), no statistics are returned.
    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    # This is a legacy parameter. Use `ConditionExpression` instead. For more information, see
    # [ConditionalOperator](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.ConditionalOperator.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ConditionalOperator", converter: ADDB::ConditionalOperator)]
    property conditional_operator : ConditionalOperator | Nil

    # A condition that must be satisfied in order for a conditional `PutItem` operation to succeed.
    #
    # An expression can contain any of the following:
    #
    # - Functions: `attribute_exists | attribute_not_exists | attribute_type | contains | begins_with
    # | size`
    #
    # These function names are case-sensitive.
    #
    # - Comparison operators: `= | <> | | = | BETWEEN | IN `
    #
    # - Logical operators: `AND | OR | NOT`
    #
    # For more information on condition expressions, see [Condition
    # Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String | Nil

    # One or more substitution tokens for attribute names in an expression. The following are some use
    # cases for using `ExpressionAttributeNames`:
    #
    # - To access an attribute whose name conflicts with a DynamoDB reserved word.
    #
    # - To create a placeholder for repeating occurrences of an attribute name in an expression.
    #
    # - To prevent special characters in an attribute name from being misinterpreted in an expression.
    #
    # Use the **#** character in an expression to dereference an attribute name. For example, consider
    # the following attribute name:
    #
    # - `Percentile`
    #
    # The name of this attribute conflicts with a reserved word, so it cannot be used directly in an
    # expression. (For the complete list of reserved words, see [Reserved
    # Words](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/ReservedWords.html) in
    # the *Amazon DynamoDB Developer Guide*). To work around this, you could specify the following for
    # `ExpressionAttributeNames`:
    #
    # - `{"#P":"Percentile"}`
    #
    # You could then use this substitution in an expression, as in this example:
    #
    # - `#P = :val`
    #
    # Tokens that begin with the **:** character are *expression attribute values*, which are
    # placeholders for the actual value at runtime.
    #
    # For more information on expression attribute names, see [Specifying Item
    # Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression.
    #
    # Use the **:** (colon) character in an expression to dereference an attribute value. For example,
    # suppose that you wanted to check whether the value of the *ProductStatus* attribute was one of
    # the following:
    #
    # `Available | Backordered | Discontinued`
    #
    # You would first need to specify `ExpressionAttributeValues` as follows:
    #
    # `{ ":avail":{"S":"Available"}, ":back":{"S":"Backordered"}, ":disc":{"S":"Discontinued"} }`
    #
    # You could then use these values in an expression, such as this:
    #
    # `ProductStatus IN (:avail, :back, :disc)`
    #
    # For more information on expression attribute values, see [Condition
    # Expressions](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.SpecifyingConditions.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    # An optional parameter that returns the item attributes for a `PutItem` operation that failed a
    # condition check.
    #
    # There is no additional cost associated with requesting a return value aside from the small
    # network and processing overhead of receiving a larger response. No read capacity units are
    # consumed.
    @[JSON::Field(key: "ReturnValuesOnConditionCheckFailure", converter: ADDB::ReturnValuesOnConditionCheckFailure)]
    property return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil

    def initialize(
      @table_name : String,
      @item : Hash(String, AttributeValue),
      @expected : Hash(String, ExpectedAttributeValue) | Nil = nil,
      @return_values : ReturnValue | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @return_item_collection_metrics : ReturnItemCollectionMetrics | Nil = nil,
      @conditional_operator : ConditionalOperator | Nil = nil,
      @condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @return_values_on_condition_check_failure : ReturnValuesOnConditionCheckFailure | Nil = nil,
    )
    end
  end
end
