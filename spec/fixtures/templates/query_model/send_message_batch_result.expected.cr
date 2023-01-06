private alias AS = Amazonite::SqsV1

module Amazonite::SqsV1
  class SendMessageBatchResult
    property successful : Array(SendMessageBatchResultEntry)
    property failed : Array(BatchResultErrorEntry)

    def initialize(
      @successful : Array(SendMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry)
    )
    end

    def initialize(node : XML::Node)
      @successful = [] of AS::SendMessageBatchResultEntry
      @failed = [] of AS::BatchResultErrorEntry
      node.children.each do |n|
        case n.name
        when "SendMessageBatchResultEntry" then @successful << AS::SendMessageBatchResultEntry.new(n)
        when "BatchResultErrorEntry"       then @failed << AS::BatchResultErrorEntry.new(n)
        end
      end
    end
  end
end
