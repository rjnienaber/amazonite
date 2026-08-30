private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class SearchVectorsInput
    include JSON::Serializable

    # The name or Amazon Resource Name (ARN) of the table containing the vector index.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # The name of the vector index to search. The index must be in the `ACTIVE` state.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    # One or more substitution tokens for attribute names in an expression. Use the `#` character in
    # an expression to dereference an attribute name.
    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    # One or more values that can be substituted in an expression. Use the `:` character in an
    # expression to dereference an attribute value.
    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    # A string that identifies one or more attributes to retrieve from the index. Separate attribute
    # names with commas. If not specified, the operation returns all attributes projected into the
    # vector index.
    #
    # Only attributes projected into the vector index can be retrieved.
    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    # The search vector to compare against the indexed vectors. Each element is a 32-bit IEEE-754
    # floating point number, provided in DynamoDB list format.
    #
    # The number of dimensions must match the number of dimensions configured for the vector index.
    @[JSON::Field(key: "SearchVector")]
    property search_vector : Array(AttributeValue) = [] of AttributeValue

    # A condition expression used to filter the vector search results. The expression can reference
    # attributes defined in the vector index search schema, including `HASH` and `INLINE_FILTER` key
    # elements.
    #
    # Only the equality operator (`=`) is supported for `HASH` attributes. Comparison and range
    # operators are supported for `INLINE_FILTER` attributes. Only top-level attributes from the
    # search schema can be referenced.
    @[JSON::Field(key: "SearchConditionExpression")]
    property search_condition_expression : String | Nil

    # The number of most similar results to return.
    @[JSON::Field(key: "TopK")]
    property top_k : Int32

    def initialize(
      @table_name : String,
      @index_name : String,
      @search_vector : Array(AttributeValue),
      @top_k : Int32,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @projection_expression : String | Nil = nil,
      @search_condition_expression : String | Nil = nil,
    )
    end

    def_equals_and_hash(@table_name, @index_name, @return_consumed_capacity, @expression_attribute_names, @expression_attribute_values, @projection_expression, @search_vector, @search_condition_expression, @top_k)
  end
end
