private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class BatchExecuteStatementInput
    include JSON::Serializable

    # The list of PartiQL statements representing the batch to run.
    @[JSON::Field(key: "Statements")]
    property statements : Array(BatchStatementRequest) = [] of BatchStatementRequest

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @statements : Array(BatchStatementRequest),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
    )
    end
  end
end
