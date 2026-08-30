module Amazonite::KinesisV1
  class ListStreamConsumersOutput
    include JSON::Serializable

    # An array of JSON objects. Each object represents one registered consumer.
    @[JSON::Field(key: "Consumers")]
    property consumers : Array(Consumer) | Nil

    # When the number of consumers that are registered with the data stream is greater than the
    # default value for the `MaxResults` parameter, or if you explicitly specify a value for
    # `MaxResults` that is less than the number of registered consumers, the response includes a
    # pagination token named `NextToken`. You can specify this `NextToken` value in a subsequent call
    # to `ListStreamConsumers` to list the next set of registered consumers. For more information
    # about the use of this pagination token when calling the `ListStreamConsumers` operation, see
    # ListStreamConsumersInput$NextToken.
    #
    # Tokens expire after 300 seconds. When you obtain a value for `NextToken` in the response to a
    # call to `ListStreamConsumers`, you have 300 seconds to use that value. If you specify an expired
    # token in a call to `ListStreamConsumers`, you get `ExpiredNextTokenException`.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @consumers : Array(Consumer) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
