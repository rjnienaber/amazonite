private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class SearchVectorsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    @[JSON::Field(key: "SearchVector")]
    property search_vector : Array(AttributeValue) = [] of AttributeValue

    @[JSON::Field(key: "SearchConditionExpression")]
    property search_condition_expression : String | Nil

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
  end
end
