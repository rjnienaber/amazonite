private alias Core = Amazonite::Core

module Amazonite::Sqs
  # A list of received messages.
  class ReceiveMessageResult
    include JSON::Serializable

    # A list of messages.
    @[JSON::Field(key: "Messages")]
    property messages : Array(Message) | Nil

    def initialize(
      @messages : Array(Message) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @messages
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@messages)
  end
end
