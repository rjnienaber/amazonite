private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListShardsOutput
    include JSON::Serializable

    # An array of JSON objects. Each object represents one shard and specifies the IDs of the shard,
    # the shard's parent, and the shard that's adjacent to the shard's parent. Each object also
    # contains the starting and ending hash keys and the starting and ending sequence numbers for the
    # shard.
    @[JSON::Field(key: "Shards")]
    property shards : Array(Shard) | Nil

    # When the number of shards in the data stream is greater than the default value for the
    # `MaxResults` parameter, or if you explicitly specify a value for `MaxResults` that is less than
    # the number of shards in the data stream, the response includes a pagination token named
    # `NextToken`. You can specify this `NextToken` value in a subsequent call to `ListShards` to list
    # the next set of shards. For more information about the use of this pagination token when calling
    # the `ListShards` operation, see ListShardsInput$NextToken.
    #
    # Tokens expire after 300 seconds. When you obtain a value for `NextToken` in the response to a
    # call to `ListShards`, you have 300 seconds to use that value. If you specify an expired token in
    # a call to `ListShards`, you get `ExpiredNextTokenException`.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @shards : Array(Shard) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @shards
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end
    end

    def_equals_and_hash(@shards, @next_token)
  end
end
