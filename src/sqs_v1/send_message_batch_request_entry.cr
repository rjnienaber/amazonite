module Amazonite::SqsV1
  class SendMessageBatchRequestEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "MessageBody")]
    property message_body : String

    @[JSON::Field(key: "DelaySeconds")]
    property delay_seconds : Int32 | Nil

    @[JSON::Field(key: "MessageAttributes")]
    property message_attributes : Hash(String, MessageAttributeValue) | Nil

    @[JSON::Field(key: "MessageSystemAttributes")]
    property message_system_attributes : Hash(MessageSystemAttributeNameForSends, MessageSystemAttributeValue) | Nil

    @[JSON::Field(key: "MessageDeduplicationId")]
    property message_deduplication_id : String | Nil

    @[JSON::Field(key: "MessageGroupId")]
    property message_group_id : String | Nil

    def initialize(
      @id : String,
      @message_body : String,
      @delay_seconds : Int32 | Nil = nil,
      @message_attributes : Hash(String, MessageAttributeValue) | Nil = nil,
      @message_system_attributes : Hash(MessageSystemAttributeNameForSends, MessageSystemAttributeValue) | Nil = nil,
      @message_deduplication_id : String | Nil = nil,
      @message_group_id : String | Nil = nil,
    )
    end
  end
end
