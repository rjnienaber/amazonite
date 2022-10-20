private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ScanInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "IndexName")]
    property index_name : String | Nil

    @[JSON::Field(key: "AttributesToGet")]
    property attributes_to_get : Array(String) | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "Select", converter: ADDB::Select)]
    property select : Select | Nil

    @[JSON::Field(key: "ScanFilter")]
    property scan_filter : Hash(String, Condition) | Nil

    @[JSON::Field(key: "ConditionalOperator", converter: ADDB::ConditionalOperator)]
    property conditional_operator : ConditionalOperator | Nil

    @[JSON::Field(key: "ExclusiveStartKey")]
    property exclusive_start_key : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    @[JSON::Field(key: "TotalSegments")]
    property total_segments : Int32 | Nil

    @[JSON::Field(key: "Segment")]
    property segment : Int32 | Nil

    @[JSON::Field(key: "ProjectionExpression")]
    property projection_expression : String | Nil

    @[JSON::Field(key: "FilterExpression")]
    property filter_expression : String | Nil

    @[JSON::Field(key: "ExpressionAttributeNames")]
    property expression_attribute_names : Hash(String, String) | Nil

    @[JSON::Field(key: "ExpressionAttributeValues")]
    property expression_attribute_values : Hash(String, AttributeValue) | Nil

    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    def initialize(
      @table_name : String,
      @index_name : String | Nil = nil,
      @attributes_to_get : Array(String) | Nil = nil,
      @limit : Int32 | Nil = nil,
      @select : Select | Nil = nil,
      @scan_filter : Hash(String, Condition) | Nil = nil,
      @conditional_operator : ConditionalOperator | Nil = nil,
      @exclusive_start_key : Hash(String, AttributeValue) | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
      @total_segments : Int32 | Nil = nil,
      @segment : Int32 | Nil = nil,
      @projection_expression : String | Nil = nil,
      @filter_expression : String | Nil = nil,
      @expression_attribute_names : Hash(String, String) | Nil = nil,
      @expression_attribute_values : Hash(String, AttributeValue) | Nil = nil,
      @consistent_read : Bool | Nil = nil
    )
    end
  end
end
