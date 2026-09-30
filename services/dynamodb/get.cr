private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Specifies an item and related attribute values to retrieve in a `TransactGetItem` object.
  class Get
    include JSON::Serializable

    # A map of attribute names to `AttributeValue` objects that specifies the primary key of the item
    # to retrieve.
    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    # The name of the table from which to retrieve the specified item. You can also provide the Amazon
    # Resource Name (ARN) of the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # A string that identifies one or more attributes of the specified item to retrieve from the
    # table. The attributes in the expression must be separated by commas. If no attribute names are
    # specified, then all attributes of the specified item are returned. If any of the requested
    # attributes are not found, they do not appear in the result.
    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    # One or more substitution tokens for attribute names in the ProjectionExpression parameter.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    def initialize(
      @key : Hash(String, AttributeValue),
      @table_name : String,
      @projection_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
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
    end

    def_equals_and_hash(@key, @table_name, @projection_expression, @expression_attribute_names)
  end
end
