private alias AS = Amazonite::SqsV1
private alias Core = Amazonite::Core

module Amazonite::SqsV1
  # Retrieves one or more messages from a specified queue.
  class ReceiveMessageRequest
    include JSON::Serializable

    # The URL of the Amazon SQS queue from which messages are received.
    #
    # Queue URLs and names are case-sensitive.
    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    # This parameter has been discontinued but will be supported for backward compatibility. To
    # provide attribute names, you are encouraged to use `MessageSystemAttributeNames`.
    #
    # A list of attributes that need to be returned along with each message. These attributes include:
    #
    # - `All` – Returns all values.
    #
    # - `ApproximateFirstReceiveTimestamp` – Returns the time the message was first received from the
    # queue ([epoch time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds).
    #
    # - `ApproximateReceiveCount` – Returns the number of times a message has been received across all
    # queues but not deleted.
    #
    # - `AWSTraceHeader` – Returns the X-Ray trace header string.
    #
    # - `SenderId`
    #
    # - For a user, returns the user ID, for example `ABCDEFGHI1JKLMNOPQ23R`.
    #
    # - For an IAM role, returns the IAM role ID, for example `ABCDE1F2GH3I4JK5LMNOP:i-a123b456`.
    #
    # - `SentTimestamp` – Returns the time the message was sent to the queue ([epoch
    # time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds).
    #
    # - `SqsManagedSseEnabled` – Enables server-side queue encryption using SQS owned encryption keys.
    # Only one server-side encryption option is supported per queue (for example,
    # [SSE-KMS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html)
    # or
    # [SSE-SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html)).
    #
    # - `MessageDeduplicationId` – Returns the value provided by the producer that calls the `
    # SendMessage ` action.
    #
    # - `MessageGroupId` – Returns the value provided by the producer that calls the ` SendMessage `
    # action.
    #
    # - `SequenceNumber` – Returns the value provided by Amazon SQS.
    @[JSON::Field(key: "AttributeNames", converter: Core::ArrayConverter(AS::QueueAttributeName))]
    property attribute_names : Array(QueueAttributeName) | Nil

    # A list of attributes that need to be returned along with each message. These attributes include:
    #
    # - `All` – Returns all values.
    #
    # - `ApproximateFirstReceiveTimestamp` – Returns the time the message was first received from the
    # queue ([epoch time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds).
    #
    # - `ApproximateReceiveCount` – Returns the number of times a message has been received across all
    # queues but not deleted.
    #
    # - `AWSTraceHeader` – Returns the X-Ray trace header string.
    #
    # - `SenderId`
    #
    # - For a user, returns the user ID, for example `ABCDEFGHI1JKLMNOPQ23R`.
    #
    # - For an IAM role, returns the IAM role ID, for example `ABCDE1F2GH3I4JK5LMNOP:i-a123b456`.
    #
    # - `SentTimestamp` – Returns the time the message was sent to the queue ([epoch
    # time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds).
    #
    # - `SqsManagedSseEnabled` – Enables server-side queue encryption using SQS owned encryption keys.
    # Only one server-side encryption option is supported per queue (for example,
    # [SSE-KMS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sse-existing-queue.html)
    # or
    # [SSE-SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-configure-sqs-sse-queue.html)).
    #
    # - `MessageDeduplicationId` – Returns the value provided by the producer that calls the `
    # SendMessage ` action.
    #
    # - `MessageGroupId` – Returns the value provided by the producer that calls the ` SendMessage `
    # action.
    #
    # - `SequenceNumber` – Returns the value provided by Amazon SQS.
    @[JSON::Field(key: "MessageSystemAttributeNames", converter: Core::ArrayConverter(AS::MessageSystemAttributeName))]
    property message_system_attribute_names : Array(MessageSystemAttributeName) | Nil

    # The name of the message attribute, where *N* is the index.
    #
    # - The name can contain alphanumeric characters and the underscore (`_`), hyphen (`-`), and
    # period (`.`).
    #
    # - The name is case-sensitive and must be unique among all attribute names for the message.
    #
    # - The name must not start with AWS-reserved prefixes such as `AWS.` or `Amazon.` (or any casing
    # variants).
    #
    # - The name must not start or end with a period (`.`), and it should not have periods in
    # succession (`..`).
    #
    # - The name can be up to 256 characters long.
    #
    # When using `ReceiveMessage`, you can send a list of attribute names to receive, or you can
    # return all of the attributes by specifying `All` or `.*` in your request. You can also use all
    # message attributes starting with a prefix, for example `bar.*`.
    @[JSON::Field(key: "MessageAttributeNames")]
    property message_attribute_names : Array(String) | Nil

    # The maximum number of messages to return. Amazon SQS never returns more messages than this value
    # (however, fewer messages might be returned). Valid values: 1 to 10. Default: 1.
    @[JSON::Field(key: "MaxNumberOfMessages")]
    property max_number_of_messages : Int32 | Nil

    # The duration (in seconds) that the received messages are hidden from subsequent retrieve
    # requests after being retrieved by a `ReceiveMessage` request. If not specified, the default
    # visibility timeout for the queue is used, which is 30 seconds.
    #
    # Understanding `VisibilityTimeout`:
    #
    # - When a message is received from a queue, it becomes temporarily invisible to other consumers
    # for the duration of the visibility timeout. This prevents multiple consumers from processing the
    # same message simultaneously. If the message is not deleted or its visibility timeout is not
    # extended before the timeout expires, it becomes visible again and can be retrieved by other
    # consumers.
    #
    # - Setting an appropriate visibility timeout is crucial. If it's too short, the message might
    # become visible again before processing is complete, leading to duplicate processing. If it's too
    # long, it delays the reprocessing of messages if the initial processing fails.
    #
    # - You can adjust the visibility timeout using the `--visibility-timeout` parameter in the
    # `receive-message` command to match the processing time required by your application.
    #
    # - A message that isn't deleted or a message whose visibility isn't extended before the
    # visibility timeout expires counts as a failed receive. Depending on the configuration of the
    # queue, the message might be sent to the dead-letter queue.
    #
    # For more information, see [Visibility
    # Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
    # in the *Amazon SQS Developer Guide*.
    @[JSON::Field(key: "VisibilityTimeout")]
    property visibility_timeout : Int32 | Nil

    # The duration (in seconds) for which the call waits for a message to arrive in the queue before
    # returning. If a message is available, the call returns sooner than `WaitTimeSeconds`. If no
    # messages are available and the wait time expires, the call does not return a message list. If
    # you are using the Java SDK, it returns a `ReceiveMessageResponse` object, which has a empty list
    # instead of a Null object.
    #
    # To avoid HTTP errors, ensure that the HTTP response timeout for `ReceiveMessage` requests is
    # longer than the `WaitTimeSeconds` parameter. For example, with the Java SDK, you can set HTTP
    # transport settings using the [
    # NettyNioAsyncHttpClient](https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/nio/netty/NettyNioAsyncHttpClient.html)
    # for asynchronous clients, or the [
    # ApacheHttpClient](https://sdk.amazonaws.com/java/api/latest/software/amazon/awssdk/http/apache/ApacheHttpClient.html)
    # for synchronous clients.
    @[JSON::Field(key: "WaitTimeSeconds")]
    property wait_time_seconds : Int32 | Nil

    # This parameter applies only to FIFO (first-in-first-out) queues.
    #
    # The token used for deduplication of `ReceiveMessage` calls. If a networking issue occurs after a
    # `ReceiveMessage` action, and instead of a response you receive a generic error, it is possible
    # to retry the same action with an identical `ReceiveRequestAttemptId` to retrieve the same set of
    # messages, even if their visibility timeout has not yet expired.
    #
    # - You can use `ReceiveRequestAttemptId` only for 5 minutes after a `ReceiveMessage` action.
    #
    # - When you set `FifoQueue`, a caller of the `ReceiveMessage` action can provide a
    # `ReceiveRequestAttemptId` explicitly.
    #
    # - It is possible to retry the `ReceiveMessage` action with the same `ReceiveRequestAttemptId` if
    # none of the messages have been modified (deleted or had their visibility changes).
    #
    # - During a visibility timeout, subsequent calls with the same `ReceiveRequestAttemptId` return
    # the same messages and receipt handles. If a retry occurs within the deduplication interval, it
    # resets the visibility timeout. For more information, see [Visibility
    # Timeout](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-visibility-timeout.html)
    # in the *Amazon SQS Developer Guide*.
    #
    # If a caller of the `ReceiveMessage` action still processes messages when the visibility timeout
    # expires and messages become visible, another worker consuming from the same queue can receive
    # the same messages and therefore process duplicates. Also, if a consumer whose message processing
    # time is longer than the visibility timeout tries to delete the processed messages, the action
    # fails with an error.
    #
    # To mitigate this effect, ensure that your application observes a safe threshold before the
    # visibility timeout expires and extend the visibility timeout as necessary.
    #
    # - While messages with a particular `MessageGroupId` are invisible, no more messages belonging to
    # the same `MessageGroupId` are returned until the visibility timeout expires. You can still
    # receive messages with another `MessageGroupId` from your FIFO queue as long as they are visible.
    #
    # - If a caller of `ReceiveMessage` can't track the `ReceiveRequestAttemptId`, no retries work
    # until the original visibility timeout expires. As a result, delays might occur but the messages
    # in the queue remain in a strict order.
    #
    # The maximum length of `ReceiveRequestAttemptId` is 128 characters. `ReceiveRequestAttemptId` can
    # contain alphanumeric characters (`a-z`, `A-Z`, `0-9`) and punctuation
    # (`!"#$%&'()*+,-./:;?@[\]^_`{|}~`).
    #
    # For best practices of using `ReceiveRequestAttemptId`, see [Using the ReceiveRequestAttemptId
    # Request
    # Parameter](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/using-receiverequestattemptid-request-parameter.html)
    # in the *Amazon SQS Developer Guide*.
    @[JSON::Field(key: "ReceiveRequestAttemptId")]
    property receive_request_attempt_id : String | Nil

    def initialize(
      @queue_url : String,
      @attribute_names : Array(QueueAttributeName) | Nil = nil,
      @message_system_attribute_names : Array(MessageSystemAttributeName) | Nil = nil,
      @message_attribute_names : Array(String) | Nil = nil,
      @max_number_of_messages : Int32 | Nil = nil,
      @visibility_timeout : Int32 | Nil = nil,
      @wait_time_seconds : Int32 | Nil = nil,
      @receive_request_attempt_id : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@queue_url, @attribute_names, @message_system_attribute_names, @message_attribute_names, @max_number_of_messages, @visibility_timeout, @wait_time_seconds, @receive_request_attempt_id)
  end
end
