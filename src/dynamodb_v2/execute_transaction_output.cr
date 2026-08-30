private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class ExecuteTransactionOutput
    include JSON::Serializable

    # The response to a PartiQL transaction.
    @[JSON::Field(key: "Responses")]
    property responses : Array(ItemResponse) | Nil

    # The capacity units consumed by the entire operation. The values of the list are ordered
    # according to the ordering of the statements.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    def initialize(
      @responses : Array(ItemResponse) | Nil = nil,
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @responses
        raise Core::ValidationError.new("Responses must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Responses must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end

      if value = @consumed_capacity
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@responses, @consumed_capacity)
  end
end
