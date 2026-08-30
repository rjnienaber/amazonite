private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class TransactGetItemsOutput
    include JSON::Serializable

    # If the *ReturnConsumedCapacity* value was `TOTAL`, this is an array of `ConsumedCapacity`
    # objects, one for each table addressed by `TransactGetItem` objects in the *TransactItems*
    # parameter. These `ConsumedCapacity` objects report the read-capacity units consumed by the
    # `TransactGetItems` call in that table.
    @[JSON::Field(key: "ConsumedCapacity")]
    property consumed_capacity : Array(ConsumedCapacity) | Nil

    # An ordered array of up to 100 `ItemResponse` objects, each of which corresponds to the
    # `TransactGetItem` object in the same position in the *TransactItems* array. Each `ItemResponse`
    # object contains a Map of the name-value pairs that are the projected attributes of the requested
    # item.
    #
    # If a requested item could not be retrieved, the corresponding `ItemResponse` object is Null, or
    # if the requested item has no projected attributes, the corresponding `ItemResponse` object is an
    # empty Map.
    @[JSON::Field(key: "Responses")]
    property responses : Array(ItemResponse) | Nil

    def initialize(
      @consumed_capacity : Array(ConsumedCapacity) | Nil = nil,
      @responses : Array(ItemResponse) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @consumed_capacity
        value.each(&.validate!)
      end

      if value = @responses
        raise Core::ValidationError.new("Responses must have at least 1 item(s)") if value.size < 1
        raise Core::ValidationError.new("Responses must have at most 100 item(s)") if value.size > 100
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@consumed_capacity, @responses)
  end
end
