module Amazonite::SqsV1
  class CreateQueueResult
    property queue_url : String | Nil

    def initialize(
      @queue_url : String | Nil = nil
    )
    end

    def initialize(node : XML::Node)
      node.children.each do |n|
        case n.name
        when "QueueUrl" then @queue_url = n.children[0].to_s
        end
      end
    end
  end
end
