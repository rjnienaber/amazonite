module Amazonite::SqsV1
  class SendMessageBatchResult
    include JSON::Serializable

    @[JSON::Field(key: "Successful")]
    property successful : Array(SendMessageBatchResultEntry) = [] of SendMessageBatchResultEntry

    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry) = [] of BatchResultErrorEntry

    def initialize(
      @successful : Array(SendMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
