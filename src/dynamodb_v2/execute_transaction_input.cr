private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ExecuteTransactionInput
    include JSON::Serializable

    @[JSON::Field(key: "TransactStatements")]
    property transact_statements : Array(ParameterizedStatement)

    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @transact_statements : Array(ParameterizedStatement),
      @client_request_token : String | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil
    )
    end
  end
end
