module Amazonite::DynamoDBv2
  class Get
    include JSON::Serializable

    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    def initialize(
      @key : Hash(String, AttributeValue),
      @table_name : String,
      @projection_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil
    )
    end
  end
end