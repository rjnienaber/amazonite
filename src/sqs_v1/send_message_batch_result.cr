module Amazonite::SqsV1
  class SendMessageBatchResult
    include JSON::Serializable

    @[JSON::Field(key: "Successful")]
    property successful : Array(SendMessageBatchResultEntry)

    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry)

    def initialize(
      @successful : Array(SendMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
