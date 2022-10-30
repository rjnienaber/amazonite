module Amazonite::DynamoDBV2
  class TransactWriteItem
    include JSON::Serializable

    @[JSON::Field(key: "ConditionCheck")]
    property condition_check : ConditionCheck | Nil

    @[JSON::Field(key: "Put")]
    property put : Put | Nil

    @[JSON::Field(key: "Delete")]
    property delete : Delete | Nil

    @[JSON::Field(key: "Update")]
    property update : Update | Nil

    def initialize(
      @condition_check : ConditionCheck | Nil = nil,
      @put : Put | Nil = nil,
      @delete : Delete | Nil = nil,
      @update : Update | Nil = nil
    )
    end
  end
end
