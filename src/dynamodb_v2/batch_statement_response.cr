private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @error
        value.validate!
      end

      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @item
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@error, @table_name, @item)
  end
end
