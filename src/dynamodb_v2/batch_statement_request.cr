module Amazonite::DynamoDBV2
  class BatchStatementRequest
    include JSON::Serializable

    @[JSON::Field(key: "Statement")]
    property statement : String

    @[JSON::Field(key: "Parameters")]
    property parameters : Array(AttributeValue) | Nil

    @[JSON::Field(key: "ConsistentRead")]
    property consistent_read : Bool | Nil

    def initialize(
      @statement : String,
      @parameters : Array(AttributeValue) | Nil = nil,
      @consistent_read : Bool | Nil = nil
    )
    end
  end
end
