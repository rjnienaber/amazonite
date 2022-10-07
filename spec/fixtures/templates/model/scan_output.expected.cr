module Amazonite
  module DynamoDB
    class ScanOutput
      include JSON::Serializable

      @[JSON::Field(key: "Items")]
      property items : Array(Hash(String, AttributeValue)) | Nil

      @[JSON::Field(key: "Count")]
      property count : Int32 | Nil

      @[JSON::Field(key: "ScannedCount")]
      property scanned_count : Int32 | Nil

      @[JSON::Field(key: "LastEvaluatedKey")]
      property last_evaluated_key : Hash(String, AttributeValue) | Nil

      @[JSON::Field(key: "ConsumedCapacity")]
      property consumed_capacity : ConsumedCapacity | Nil

      def initialize(
        @items : Array(Hash(String, AttributeValue)) | Nil = nil,
        @count : Int32 | Nil = nil,
        @scanned_count : Int32 | Nil = nil,
        @last_evaluated_key : Hash(String, AttributeValue) | Nil = nil,
        @consumed_capacity : ConsumedCapacity | Nil = nil
      )
      end
    end
  end
end
