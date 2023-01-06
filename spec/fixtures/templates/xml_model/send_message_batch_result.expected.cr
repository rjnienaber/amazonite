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
      @successful = [] of SendMessageBatchResultEntry
      @failed = [] of BatchResultErrorEntry
      node.children.each do |n|
        case n.name
        when "SendMessageBatchResultEntry" then @successful << SendMessageBatchResultEntry.new(n)
        when "BatchResultErrorEntry"       then @failed << BatchResultErrorEntry.new(n)
        end
      end
    end
  end
end
