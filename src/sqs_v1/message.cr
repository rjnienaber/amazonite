module Amazonite::SqsV1
  class Message
    include JSON::Serializable

    @[JSON::Field(key: "MessageId")]
    property message_id : String | Nil

    @[JSON::Field(key: "ReceiptHandle")]
    property receipt_handle : String | Nil

    @[JSON::Field(key: "MD5OfBody")]
    property md5_of_body : String | Nil

    @[JSON::Field(key: "Body")]
    property body : String | Nil

    @[JSON::Field(key: "Attributes")]
    property attributes : Hash(MessageSystemAttributeName, String) | Nil

    @[JSON::Field(key: "MD5OfMessageAttributes")]
    property md5_of_message_attributes : String | Nil

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
  end
end
