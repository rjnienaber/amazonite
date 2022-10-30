module Amazonite::DynamoDBV2
  class BatchExecuteStatementOutput
    include JSON::Serializable

    @[JSON::Field(key: "Responses")]
    property responses : Array(BatchStatementResponse) | Nil

    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    def initialize(
      @responses : Array(BatchStatementResponse) | Nil = nil,
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil
    )
    end
  end
end
