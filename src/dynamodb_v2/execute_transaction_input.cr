private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class ExecuteTransactionInput
    include JSON::Serializable

    # The list of PartiQL statements representing the transaction to run.
    @[JSON::Field(key: "TransactStatements")]
    property transact_statements : Array(ParameterizedStatement) = [] of ParameterizedStatement

    # Set this value to get remaining results, if `NextToken` was returned in the statement response.
    @[JSON::Field(key: "ClientRequestToken")]
    property client_request_token : String | Nil

    # Determines the level of detail about either provisioned or on-demand throughput consumption that
    # is returned in the response. For more information, see
    # [TransactGetItems](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactGetItems.html)
    # and
    # [TransactWriteItems](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_TransactWriteItems.html).
    @[JSON::Field(key: "ReturnConsumedCapacity", converter: ADDB::ReturnConsumedCapacity)]
    property return_consumed_capacity : ReturnConsumedCapacity | Nil

    def initialize(
      @transact_statements : Array(ParameterizedStatement),
      @client_request_token : String | Nil = nil,
      @return_consumed_capacity : ReturnConsumedCapacity | Nil = nil,
    )
    end

    def_equals_and_hash(@transact_statements, @client_request_token, @return_consumed_capacity)
  end
end
