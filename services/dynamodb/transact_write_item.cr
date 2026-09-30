private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # A list of requests that can perform update, put, delete, or check operations on multiple items
  # in one or more tables atomically.
  class TransactWriteItem
    include JSON::Serializable

    # A request to perform a check item operation.
    @[JSON::Field(key: "ConditionCheck")]
    property condition_check : ConditionCheck | Nil

    # A request to perform a `PutItem` operation.
    @[JSON::Field(key: "Put")]
    property put : Put | Nil

    # A request to perform a `DeleteItem` operation.
    @[JSON::Field(key: "Delete")]
    property delete : Delete | Nil

    # A request to perform an `UpdateItem` operation.
    @[JSON::Field(key: "Update")]
    property update : Update | Nil

    def initialize(
      @condition_check : ConditionCheck | Nil = nil,
      @put : Put | Nil = nil,
      @delete : Delete | Nil = nil,
      @update : Update | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @condition_check
        value.validate!
      end

      if value = @put
        value.validate!
      end

      if value = @delete
        value.validate!
      end

      if value = @update
        value.validate!
      end
    end

    def_equals_and_hash(@condition_check, @put, @delete, @update)
  end
end
