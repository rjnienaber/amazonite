module Amazonite::SqsV1
  class DeleteMessageBatchResult
    include JSON::Serializable

    @[JSON::Field(key: "Successful")]
    property successful : Array(DeleteMessageBatchResultEntry) = [] of DeleteMessageBatchResultEntry

    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry) = [] of BatchResultErrorEntry

    def initialize(
      @successful : Array(DeleteMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
