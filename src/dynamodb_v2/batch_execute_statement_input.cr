private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @statements
        raise Core::ValidationError.new("Statements must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Statements must have at most 25 item(s)") if value.size > 25
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@statements, @return_consumed_capacity)
  end
end
