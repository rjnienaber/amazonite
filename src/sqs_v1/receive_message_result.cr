module Amazonite::SqsV1
  class ReceiveMessageResult
    include JSON::Serializable

    @[JSON::Field(key: "Messages")]
    property messages : Array(Message) | Nil

    def initialize(
      @messages : Array(Message) | Nil = nil,
    )
    end
  end
end
