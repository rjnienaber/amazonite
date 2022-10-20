module Amazonite::DynamoDBv2
  class TransactGetItemsOutput
    include JSON::Serializable

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    @[JSON::Field(key: "Responses")]
    property responses : Array(ItemResponse) | Nil

    def initialize(
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil,
      @responses : Array(ItemResponse) | Nil = nil
    )
    end
  end
end
