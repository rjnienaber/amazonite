module Amazonite::DynamoDBV2
  class BatchExecuteStatementOutput
    include JSON::Serializable

    # The response to each PartiQL statement in the batch. The values of the list are ordered
    # according to the ordering of the request statements.
    @[JSON::Field(key: "Responses")]
    property responses : Array(BatchStatementResponse) | Nil

    # The capacity units consumed by the entire operation. The values of the list are ordered
    # according to the ordering of the statements.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    def initialize(
      @responses : Array(BatchStatementResponse) | Nil = nil,
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil,
    )
    end
  end
end
