private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class QueryInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "Select", converter: ADDB::Select)]
    property select : Select | Nil

    @[JSON::Field(key: "AttributesToGet")]
    property attributes_to_get : Array(String) | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    @[JSON::Field(key: "KeyConditions")]
    property key_conditions : Hash(String, Condition) | Nil

    @[JSON::Field(key: "QueryFilter")]
    property query_filter : Hash(String, Condition) | Nil

    @[JSON::Field(key: "ConditionalOperator", converter: ADDB::ConditionalOperator)]
    property conditional_operator : ConditionalOperator | Nil

    @[JSON::Field(key: "ScanIndexForward")]
    property scan_index_forward : Bool | Nil

    @[JSON::Field(key: "ExclusiveStartKey")]
    property exclusive_start_key : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    @[JSON::Field(key: "FilterExpression")]
    property filter_expression : String | Nil

    @[JSON::Field(key: "KeyConditionExpression")]
    property key_condition_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    def initialize(
      @table_name : String,
      @index_name : String | Nil = nil,
      @select : Select | Nil = nil,
      @attributes_to_get : Array(String) | Nil = nil,
      @limit : Int32 | Nil = nil,
      @consistent_read : Bool | Nil = nil,
      @key_conditions : Hash(String, Condition) | Nil = nil,
      @query_filter : Hash(String, Condition) | Nil = nil,
      @conditional_operator : ConditionalOperator | Nil = nil,
      @scan_index_forward : Bool | Nil = nil,
      @exclusive_start_key : Hash(String, AttributeValue) | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @projection_expression : String | Nil = nil,
      @filter_expression : String | Nil = nil,
      @key_condition_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil
    )
    end
  end
end