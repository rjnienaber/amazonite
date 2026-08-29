module Amazonite::SqsV1
  class SendMessageBatchResultEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "MessageId")]
    property message_id : String

    @[JSON::Field(key: "MD5OfMessageBody")]
    property md5_of_message_body : String

    @[JSON::Field(key: "MD5OfMessageAttributes")]
    property md5_of_message_attributes : String | Nil

    @[JSON::Field(key: "MD5OfMessageSystemAttributes")]
    property md5_of_message_system_attributes : String | Nil

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
  end
end
