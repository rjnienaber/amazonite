module Amazonite::SqsV1
  class DeleteMessageBatchResult
    include JSON::Serializable

    @[JSON::Field(key: "Successful")]
    property successful : Array(DeleteMessageBatchResultEntry)

    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry)

    def initialize(
      @successful : Array(DeleteMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
