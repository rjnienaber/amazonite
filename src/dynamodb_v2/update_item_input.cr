private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class UpdateItemInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "Key")]
    property key : Hash(String, AttributeValue)

    @[JSON::Field(key: "AttributeUpdates")]
    property attribute_updates : Hash(String, AttributeValueUpdate) | Nil

    @[JSON::Field(key: "Expected")]
    property expected : Hash(String, ExpectedAttributeValue) | Nil

    @[JSON::Field(key: "ConditionalOperator", converter: ADDB::ConditionalOperator)]
    property conditional_operator : ConditionalOperator | Nil

    @[JSON::Field(key: "ReturnValues", converter: ADDB::ReturnValue)]
    property return_values : ReturnValue | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ReturnItemCollectionMetrics", converter: ADDB::ReturnItemCollectionMetrics)]
    property return_item_collection_metrics : ReturnItemCollectionMetrics | Nil

    @[JSON::Field(key: "UpdateExpression")]
    property update_expression : String | Nil

    @[JSON::Field(key: "ConditionExpression")]
    property condition_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    def initialize(
      @table_name : String,
      @key : Hash(String, AttributeValue),
      @attribute_updates : Hash(String, AttributeValueUpdate) | Nil = nil,
      @expected : Hash(String, ExpectedAttributeValue) | Nil = nil,
      @conditional_operator : ConditionalOperator | Nil = nil,
      @return_values : ReturnValue | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @return_item_collection_metrics : ReturnItemCollectionMetrics | Nil = nil,
      @update_expression : String | Nil = nil,
      @condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil
    )
    end
  end
end
