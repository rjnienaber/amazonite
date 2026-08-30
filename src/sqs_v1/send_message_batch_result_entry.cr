module Amazonite::SqsV1
  # Encloses a `MessageId` for a successfully-enqueued message in a ` SendMessageBatch.`
  class SendMessageBatchResultEntry
    include JSON::Serializable

    # An identifier for the message in this batch.
    @[JSON::Field(key: "Id")]
    property id : String

    # An identifier for the message.
    @[JSON::Field(key: "MessageId")]
    property message_id : String

    # An MD5 digest of the non-URL-encoded message body string. You can use this attribute to verify
    # that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
    # creating the MD5 digest. For information about MD5, see
    # [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
    @[JSON::Field(key: "MD5OfMessageBody")]
    property md5_of_message_body : String

    # An MD5 digest of the non-URL-encoded message attribute string. You can use this attribute to
    # verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message before
    # creating the MD5 digest. For information about MD5, see
    # [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
    @[JSON::Field(key: "MD5OfMessageAttributes")]
    property md5_of_message_attributes : String | Nil

    # An MD5 digest of the non-URL-encoded message system attribute string. You can use this attribute
    # to verify that Amazon SQS received the message correctly. Amazon SQS URL-decodes the message
    # before creating the MD5 digest. For information about MD5, see
    # [RFC1321](https://www.ietf.org/rfc/rfc1321.txt).
    @[JSON::Field(key: "MD5OfMessageSystemAttributes")]
    property md5_of_message_system_attributes : String | Nil

    # This parameter applies only to FIFO (first-in-first-out) queues.
    #
    # The large, non-consecutive number that Amazon SQS assigns to each message.
    #
    # The length of `SequenceNumber` is 128 bits. As `SequenceNumber` continues to increase for a
    # particular `MessageGroupId`.
    @[JSON::Field(key: "SequenceNumber")]
    property sequence_number : String | Nil

    def initialize(
      @id : String,
      @message_id : String,
      @md5_of_message_body : String,
      @md5_of_message_attributes : String | Nil = nil,
      @md5_of_message_system_attributes : String | Nil = nil,
      @sequence_number : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @message_id, @md5_of_message_body, @md5_of_message_attributes, @md5_of_message_system_attributes, @sequence_number)
  end
end
