module Amazonite::DynamoDBv2
  class KeysAndAttributes
    include JSON::Serializable

    @[JSON::Field(key: "Keys")]
    property keys : Array(Hash(String, AttributeValue))

    @[JSON::Field(key: "AttributesToGet")]
    property attributes_to_get : Array(String) | Nil

    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    def initialize(
      @keys : Array(Hash(String, AttributeValue)),
      @attributes_to_get : Array(String) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @projection_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil
    )
    end
  end
end