private alias Core = Amazonite::Core

module Amazonite::Lambda
  class ListEventSourceMappingsRequest
    include JSON::Serializable

    # The Amazon Resource Name (ARN) of the event source.
    #
    # - **Amazon Kinesis** – The ARN of the data stream or a stream consumer.
    #
    # - **Amazon DynamoDB Streams** – The ARN of the stream.
    #
    # - **Amazon Simple Queue Service** – The ARN of the queue.
    #
    # - **Amazon Managed Streaming for Apache Kafka** – The ARN of the cluster or the ARN of the VPC
    # connection (for [cross-account event source
    # mappings](https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#msk-multi-vpc)).
    #
    # - **Amazon MQ** – The ARN of the broker.
    #
    # - **Amazon DocumentDB** – The ARN of the DocumentDB change stream.
    @[JSON::Field(key: "EventSourceArn", ignore: true)]
    property event_source_arn : String | Nil

    # The name or ARN of the Lambda function.
    #
    # **Name formats**
    #
    # - **Function name** – `MyFunction`.
    #
    # - **Function ARN** – `arn:aws:lambda:us-west-2:123456789012:function:MyFunction`.
    #
    # - **Version or Alias ARN** – `arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD`.
    #
    # - **Partial ARN** – `123456789012:function:MyFunction`.
    #
    # The length constraint applies only to the full ARN. If you specify only the function name, it's
    # limited to 64 characters in length.
    @[JSON::Field(key: "FunctionName", ignore: true)]
    property function_name : String | Nil

    # A pagination token returned by a previous call.
    @[JSON::Field(key: "Marker", ignore: true)]
    property marker : String | Nil

    # The maximum number of event source mappings to return. Note that ListEventSourceMappings returns
    # a maximum of 100 items in each response, even if you set the number higher.
    @[JSON::Field(key: "MaxItems", ignore: true)]
    property max_items : Int32 | Nil

    def initialize(
      @event_source_arn : String | Nil = nil,
      @function_name : String | Nil = nil,
      @marker : String | Nil = nil,
      @max_items : Int32 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @event_source_arn
        raise Core::ValidationError.new("EventSourceArn length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("EventSourceArn length must be <= 10000") if value.size > 10000
        raise Core::ValidationError.new("EventSourceArn does not match the required pattern") unless value.matches?(Regex.new("^arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\\-])+:((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1})?:(\\d{12})?:(.*)$"))
      end

      if value = @function_name
        raise Core::ValidationError.new("FunctionName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("FunctionName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("FunctionName does not match the required pattern") unless value.matches?(Regex.new("^(arn:(aws[a-zA-Z-]*)?:lambda:)?((eusc-)?[a-z]{2}((-gov)|(-iso([a-z]?)))?-[a-z]+-\\d{1}:)?(\\d{12}:)?(function:)?([a-zA-Z0-9-_\\.]+)(:(\\$LATEST(\\.PUBLISHED)?|[a-zA-Z0-9-_]+))?$"))
      end

      if value = @max_items
        raise Core::ValidationError.new("MaxItems value must be >= 1") if value < 1
        raise Core::ValidationError.new("MaxItems value must be <= 10000") if value > 10000
      end
    end

    def_equals_and_hash(@event_source_arn, @function_name, @marker, @max_items)
  end
end
