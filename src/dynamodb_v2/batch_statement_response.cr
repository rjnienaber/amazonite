module Amazonite::DynamoDBV2
  # A PartiQL batch statement response..
  class BatchStatementResponse
    include JSON::Serializable

    # The error associated with a failed PartiQL batch statement.
    @[JSON::Field(key: "Error")]
    property error : BatchStatementError | Nil

    # The table name associated with a failed PartiQL batch statement.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # A DynamoDB item associated with a BatchStatementResponse
    @[JSON::Field(key: "Item")]
    property item : Hash(String, AttributeValue) | Nil

    def initialize(
      @error : BatchStatementError | Nil = nil,
      @table_name : String | Nil = nil,
      @item : Hash(String, AttributeValue) | Nil = nil,
    )
    end
  end
end
