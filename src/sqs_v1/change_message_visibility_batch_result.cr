module Amazonite::SqsV1
  class ChangeMessageVisibilityBatchResult
    include JSON::Serializable

    @[JSON::Field(key: "Successful")]
    property successful : Array(ChangeMessageVisibilityBatchResultEntry) = [] of ChangeMessageVisibilityBatchResultEntry

    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry) = [] of BatchResultErrorEntry

    def initialize(
      @successful : Array(ChangeMessageVisibilityBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
