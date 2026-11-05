private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Contains identifying information for a table associated with a bulk operation.
  class BulkOperationTableDetail
    include JSON::Serializable

    # The name or ARN of the table associated with the bulk operation.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The unique identifier of the table associated with the bulk operation.
    @[JSON::Field(key: "TableId")]
    property table_id : String | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @table_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @table_id
        raise Core::ValidationError.new("TableId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$"))
      end
    end

    def_equals_and_hash(@table_name, @table_id)
  end
end
