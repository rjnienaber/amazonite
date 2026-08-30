private alias Core = Amazonite::Core

module Amazonite::SqsV1
  # An Amazon SQS message.
  class Message
    include JSON::Serializable

    # A unique identifier for the message. A `MessageId`is considered unique across all Amazon Web
    # Services accounts for an extended period of time.
    @[JSON::Field(key: "MessageId")]
    property message_id : String | Nil

    # An identifier associated with the act of receiving the message. A new receipt handle is returned
    # every time you receive a message. When deleting a message, you provide the last received receipt
    # handle to delete the message.
    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String | Nil

    # An MD5 digest of the non-URL-encoded message body string.
    @[JSON::Field(key: "MD5OfBody")]
    property md5_of_body : String | Nil

    # The message's contents (not URL-encoded).
    @[JSON::Field(key: "Body")]
    property body : String | Nil

    # A map of the attributes requested in ` ReceiveMessage ` to their respective values. Supported
    # attributes:
    #
    # - `ApproximateReceiveCount`
    #
    # - `ApproximateFirstReceiveTimestamp`
    #
    # - `MessageDeduplicationId`
    #
    # - `MessageGroupId`
    #
    # - `SenderId`
    #
    # - `SentTimestamp`
    #
    # - `SequenceNumber`
    #
    # `ApproximateFirstReceiveTimestamp` and `SentTimestamp` are each returned as an integer
    # representing the [epoch time](http://en.wikipedia.org/wiki/Unix_time) in milliseconds.
    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(MessageSystemAttributeName, String) | Nil

    # An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to
    # verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
    # creating the MD5 digest. For information about MD5, see
    # [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
    @[JSON::Field(key: "MD5OfMessageAttributes")]
    property md5_of_message_attributes : String | Nil

    # Each message attribute consists of a `Name`, `Type`, and `Value`. For more information, see
    # [Amazon SQS message
    # attributes](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-message-metadata.html#sqs-message-attributes)
    # in the *Amazon SQS Developer Guide*.
    @[JSON::Field(key: "MessageAttributes")]
    property message_attributes : Hash(String, MessageAttributeValue) | Nil

    def initialize(
      @message_id : String | Nil = nil,
      @receipt_handle : String | Nil = nil,
      @md5_of_body : String | Nil = nil,
      @body : String | Nil = nil,
      @attributes : Hash(MessageSystemAttributeName, String) | Nil = nil,
      @md5_of_message_attributes : String | Nil = nil,
      @message_attributes : Hash(String, MessageAttributeValue) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @message_attributes
        value.each_value(&.validate!)
      end
    end

    def_equals_and_hash(@message_id, @receipt_handle, @md5_of_body, @body, @attributes, @md5_of_message_attributes, @message_attributes)
  end
end
