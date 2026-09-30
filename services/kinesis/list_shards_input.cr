private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListShardsInput
    include JSON::Serializable

    # The name of the data stream whose shards you want to list.
    #
    # You cannot specify this parameter if you specify the `NextToken` parameter.
    @[JSON::Field(key: "StreamName")]
    property stream_name : String | Nil

    # When the number of shards in the data stream is greater than the default value for the
    # `MaxResults` parameter, or if you explicitly specify a value for `MaxResults` that is less than
    # the number of shards in the data stream, the response includes a pagination token named
    # `NextToken`. You can specify this `NextToken` value in a subsequent call to `ListShards` to list
    # the next set of shards.
    #
    # Don't specify `StreamName` or `StreamCreationTimestamp` if you specify `NextToken` because the
    # latter unambiguously identifies the stream.
    #
    # You can optionally specify a value for the `MaxResults` parameter when you specify `NextToken`.
    # If you specify a `MaxResults` value that is less than the number of shards that the operation
    # returns if you don't specify `MaxResults`, the response will contain a new `NextToken` value.
    # You can use the new `NextToken` value in a subsequent call to the `ListShards` operation.
    #
    # Tokens expire after 300 seconds. When you obtain a value for `NextToken` in the response to a
    # call to `ListShards`, you have 300 seconds to use that value. If you specify an expired token in
    # a call to `ListShards`, you get `ExpiredNextTokenException`.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # Specify this parameter to indicate that you want to list the shards starting with the shard
    # whose ID immediately follows `ExclusiveStartShardId`.
    #
    # If you don't specify this parameter, the default behavior is for `ListShards` to list the shards
    # starting with the first one in the stream.
    #
    # You cannot specify this parameter if you specify `NextToken`.
    @[JSON::Field(key: "ExclusiveStartShardId")]
    property exclusive_start_shard_id : String | Nil

    # The maximum number of shards to return in a single call to `ListShards`. The maximum number of
    # shards to return in a single call. The default value is 1000. If you specify a value greater
    # than 1000, at most 1000 results are returned.
    #
    # When the number of shards to be listed is greater than the value of `MaxResults`, the response
    # contains a `NextToken` value that you can use in a subsequent call to `ListShards` to list the
    # next set of shards.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # Specify this input parameter to distinguish data streams that have the same name. For example,
    # if you create a data stream and then delete it, and you later create another data stream with
    # the same name, you can use this input parameter to specify which of the two streams you want to
    # list the shards for.
    #
    # You cannot specify this parameter if you specify the `NextToken` parameter.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time | Nil

    # Enables you to filter out the response of the `ListShards` API. You can only specify one filter
    # at a time.
    #
    # If you use the `ShardFilter` parameter when invoking the ListShards API, the `Type` is the
    # required property and must be specified. If you specify the `AT_TRIM_HORIZON`,
    # `FROM_TRIM_HORIZON`, or `AT_LATEST` types, you do not need to specify either the `ShardId` or
    # the `Timestamp` optional properties.
    #
    # If you specify the `AFTER_SHARD_ID` type, you must also provide the value for the optional
    # `ShardId` property. The `ShardId` property is identical in fuctionality to the
    # `ExclusiveStartShardId` parameter of the `ListShards` API. When `ShardId` property is specified,
    # the response includes the shards starting with the shard whose ID immediately follows the
    # `ShardId` that you provided.
    #
    # If you specify the `AT_TIMESTAMP` or `FROM_TIMESTAMP_ID` type, you must also provide the value
    # for the optional `Timestamp` property. If you specify the AT_TIMESTAMP type, then all shards
    # that were open at the provided timestamp are returned. If you specify the FROM_TIMESTAMP type,
    # then all shards starting from the provided timestamp to TIP are returned.
    @[JSON::Field(key: "ShardFilter")]
    property shard_filter : ShardFilter | Nil

    # The ARN of the stream.
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_name : String | Nil = nil,
      @next_token : String | Nil = nil,
      @exclusive_start_shard_id : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @stream_creation_timestamp : Time | Nil = nil,
      @shard_filter : ShardFilter | Nil = nil,
      @stream_arn : String | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_name
        raise Core::ValidationError.new("StreamName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamName length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("StreamName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end

      if value = @exclusive_start_shard_id
        raise Core::ValidationError.new("ExclusiveStartShardId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("ExclusiveStartShardId length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("ExclusiveStartShardId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10000") if value > 10000
      end

      if value = @shard_filter
        value.validate!
      end

      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_name, @next_token, @exclusive_start_shard_id, @max_results, @stream_creation_timestamp, @shard_filter, @stream_arn, @stream_id)
  end
end
