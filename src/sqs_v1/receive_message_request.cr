private alias AS = Amazonite::SqsV1
private alias Core = Amazonite::Core

module Amazonite::SqsV1
  class ReceiveMessageRequest
    include JSON::Serializable

    @[JSON::Field(key: "QueueUrl")]
    property queue_url : String

    @[JSON::Field(key: "AttributeNames", converter: Core::ArrayConverter(AS::QueueAttributeName))]
    property attribute_names : Array(QueueAttributeName) | Nil

    @[JSON::Field(key: "MessageSystemAttributeNames", converter: Core::ArrayConverter(AS::MessageSystemAttributeName))]
    property message_system_attribute_names : Array(MessageSystemAttributeName) | Nil

    @[JSON::Field(key: "MessageAttributeNames")]
    property message_attribute_names : Array(String) | Nil

    @[JSON::Field(key: "MaxNumberOfMessages")]
    property max_number_of_messages : Int32 | Nil

    @[JSON::Field(key: "VisibilityTimeout")]
    property visibility_timeout : Int32 | Nil

    @[JSON::Field(key: "WaitTimeSeconds")]
    property wait_time_seconds : Int32 | Nil

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
  end
end
