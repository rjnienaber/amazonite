module Amazonite::SqsV1
  # The `MD5OfMessageBody` and `MessageId` elements.
  class SendMessageResult
    include JSON::Serializable

    # An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify
    # that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
    # creating the MD5 digest. For information about MD5, see
    # [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
    @[JSON::Field(key: "MD5OfMessageBody")]
    property md5_of_message_body : String | Nil

    # An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to
    # verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
    # creating the MD5 digest. For information about MD5, see
    # [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
    @[JSON::Field(key: "MD5OfMessageAttributes")]
    property md5_of_message_attributes : String | Nil

    # An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute
    # to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message
    # before creating the MD5 digest.
    @[JSON::Field(key: "MD5OfMessageSystemAttributes")]
    property md5_of_message_system_attributes : String | Nil

    # An attribute containing the `MessageId` of the message sent to the queue. For more information,
    # see [Queue and Message
    # Identifiers](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-queue-message-identifiers.html)
    # in the *Amazon SQS Developer Guide*.
    @[JSON::Field(key: "MessageId")]
    property message_id : String | Nil

    # This parameter applies only to FIFO (first-in-first-out) queues.
    #
    # The large, non-consecutive number that Amazon SQS assigns to each message.
    #
    # The length of `SequenceNumber` is 128 bits. `SequenceNumber` continues to increase for a
    # particular `MessageGroupId`.
    @[JSON::Field(key: "SequenceNumber")]
    property sequence_number : String | Nil

    def initialize(
      @md5_of_message_body : String | Nil = nil,
      @md5_of_message_attributes : String | Nil = nil,
      @md5_of_message_system_attributes : String | Nil = nil,
      @message_id : String | Nil = nil,
      @sequence_number : String | Nil = nil,
    )
    end

    def_equals_and_hash(@md5_of_message_body, @md5_of_message_attributes, @md5_of_message_system_attributes, @message_id, @sequence_number)
  end
end
