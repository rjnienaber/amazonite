private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class PutItemInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue)

    @[JSON::Field(key: "Expected")]
    property expected : Hash(String, ExpectedAttributeValue) | Nil

    @[JSON::Field(key: "ReturnValues", converter: ADDB::ReturnValue)]
    property return_values : ReturnValue | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    @[JSON::Field(key: "ConditionalOperator", converter: ADDB::ConditionalOperator)]
    property conditional_operator : ConditionalOperator | Nil

    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

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
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil
    )
    end
  end
end