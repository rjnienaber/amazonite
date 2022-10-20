private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class BatchExecuteStatementInput
    include JSON::Serializable

    @[JSON::Field(key: "Statements")]
    property statements : Array(BatchStatementRequest)

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @statements : Array(BatchStatementRequest),
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil
    )
    end
  end
end
