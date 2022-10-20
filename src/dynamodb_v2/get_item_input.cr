private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class GetItemInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    @[JSON::Field(key: "AttributesToGet")]
    property attributes_to_get : Array(String) | Nil

    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    def initialize(
      @table_name : String,
      @key : Hash(String, AttributeValue),
      @attributes_to_get : Array(String) | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @projection_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil
    )
    end
  end
end