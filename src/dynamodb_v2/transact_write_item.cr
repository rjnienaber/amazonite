module Amazonite::DynamoDBV2
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
  end
end
