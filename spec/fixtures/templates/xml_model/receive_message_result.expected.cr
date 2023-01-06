module Amazonite::SqsV1
  class ReceiveMessageResult
    property messages : Array(Message) | Nil

    def initialize(
      @messages : Array(Message) | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      messages = [] of Message
      node.children.each do |n|
        case n.name
        when "Message" then messages << Message.new(n)
        end
      end

      @messages = messages unless messages.size.zero?
    end
  end
end
