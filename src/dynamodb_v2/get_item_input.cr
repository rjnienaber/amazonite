private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the input of a `GetItem` operation.
  class GetItemInput
    include JSON::Serializable

    # The name of the table containing the requested item. You can also provide the Amazon Resource
    # Name (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # A map of attribute names to `AttributeValue` objects, representing the primary key of the item
    # to retrieve.
    #
    # For the primary key, you must provide all of the attributes. For example, with a simple primary
    # key, you only need to provide a value for the partition key. For a composite primary key, you
    # must provide values for both the partition key and the sort key.
    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    # This is a legacy parameter. Use `ProjectionExpression` instead. For more information, see
    # [AttributesToGet](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/LegacyConditionalParameters.AttributesToGet.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "AttributesToGet")]
    property attributes_to_get : Array(String) | Nil

    # Determines the read consistency model: If set to `true`, then the operation uses strongly
    # consistent reads; otherwise, the operation uses eventually consistent reads.
    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # A string that identifies one or more attributes to retrieve from the table. These attributes can
    # include scalars, sets, or elements of a JSON document. The attributes in the expression must be
    # separated by commas.
    #
    # If no attribute names are specified, then all attributes are returned. If any of the requested
    # attributes are not found, they do not appear in the result.
    #
    # For more information, see [Specifying Item
    # Attributes](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.AccessingItemAttributes.html)
    # in the *Amazon DynamoDB Developer Guide*.
    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

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

    def initialize(
      @table_name : String,
      @key : Hash(String, AttributeValue),
      @attributes_to_get : Array(String) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @projection_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @key
        value.each_value(&.validate!)
      end

      if value = @attributes_to_get
        raise Core::ValidationError.new("AttributesToGet must have at least 1 item(s)") if value.size < 1
      end
    end

    def_equals_and_hash(@table_name, @key, @attributes_to_get, @consistent_read, @return_consumed_capacity, @projection_expression, @expression_attribute_names)
  end
end
