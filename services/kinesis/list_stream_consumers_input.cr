private alias Core = Amazonite::Core

module Amazonite::Kinesis
  class ListStreamConsumersInput
    include JSON::Serializable

    # The ARN of the Kinesis data stream for which you want to list the registered consumers. For more
    # information, see [Amazon Resource Names (ARNs) and Amazon Web Services Service
    # Namespaces](https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams).
    @[JSON::Field(key: "StreamARN")]
    property stream_arn : String

    # When the number of consumers that are registered with the data stream is greater than the
    # default value for the `MaxResults` parameter, or if you explicitly specify a value for
    # `MaxResults` that is less than the number of consumers that are registered with the data stream,
    # the response includes a pagination token named `NextToken`. You can specify this `NextToken`
    # value in a subsequent call to `ListStreamConsumers` to list the next set of registered
    # consumers.
    #
    # Don't specify `StreamName` or `StreamCreationTimestamp` if you specify `NextToken` because the
    # latter unambiguously identifies the stream.
    #
    # You can optionally specify a value for the `MaxResults` parameter when you specify `NextToken`.
    # If you specify a `MaxResults` value that is less than the number of consumers that the operation
    # returns if you don't specify `MaxResults`, the response will contain a new `NextToken` value.
    # You can use the new `NextToken` value in a subsequent call to the `ListStreamConsumers`
    # operation to list the next set of consumers.
    #
    # Tokens expire after 300 seconds. When you obtain a value for `NextToken` in the response to a
    # call to `ListStreamConsumers`, you have 300 seconds to use that value. If you specify an expired
    # token in a call to `ListStreamConsumers`, you get `ExpiredNextTokenException`.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    # The maximum number of consumers that you want a single call of `ListStreamConsumers` to return.
    # The default value is 100. If you specify a value greater than 100, at most 100 results are
    # returned.
    @[JSON::Field(key: "MaxResults")]
    property max_results : Int32 | Nil

    # Specify this input parameter to distinguish data streams that have the same name. For example,
    # if you create a data stream and then delete it, and you later create another data stream with
    # the same name, you can use this input parameter to specify which of the two streams you want to
    # list the consumers for.
    #
    # You can't specify this parameter if you specify the NextToken parameter.
    @[JSON::Field(key: "StreamCreationTimestamp", converter: Core::AWSEpochConverter)]
    property stream_creation_timestamp : Time | Nil

    # Not Implemented. Reserved for future use.
    @[JSON::Field(key: "StreamId")]
    property stream_id : String | Nil

    def initialize(
      @stream_arn : String,
      @next_token : String | Nil = nil,
      @max_results : Int32 | Nil = nil,
      @stream_creation_timestamp : Time | Nil = nil,
      @stream_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @stream_arn
        raise Core::ValidationError.new("StreamARN length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamARN length must be <= 2048") if value.size > 2048
        raise Core::ValidationError.new("StreamARN does not match the required pattern") unless value.matches?(Regex.new("^arn:aws.*:kinesis:.*:\\d{12}:stream/\\S+$"))
      end

      if value = @next_token
        raise Core::ValidationError.new("NextToken length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("NextToken length must be <= 1048576") if value.size > 1048576
      end

      if value = @max_results
        raise Core::ValidationError.new("MaxResults value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxResults value must be <= 10000") if value > 10000
      end

      if value = @stream_id
        raise Core::ValidationError.new("StreamId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StreamId length must be <= 24") if value.size > 24
        raise Core::ValidationError.new("StreamId does not match the required pattern") unless value.matches?(Regex.new("^[a-z0-9]{20}-[a-z0-9]{3}$"))
      end
    end

    def_equals_and_hash(@stream_arn, @next_token, @max_results, @stream_creation_timestamp, @stream_id)
  end
end
