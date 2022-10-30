module Amazonite::DynamoDBV2
  class BatchStatementResponse
    include JSON::Serializable

    @[JSON::Field(key: "Error")]
    property error : BatchStatementError | Nil

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    def initialize(
      @error : BatchStatementError | Nil = nil,
      @table_name : String | Nil = nil,
      @item : Hash(String, AttributeValue) | Nil = nil
    )
    end
  end
end
