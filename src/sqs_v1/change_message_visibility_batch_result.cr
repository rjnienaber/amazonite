module Amazonite::SqsV1
  class ChangeMessageVisibilityBatchResult
    include JSON::Serializable

    @[JSON::Field(key: "Successful")]
    property successful : Array(ChangeMessageVisibilityBatchResultEntry)

    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry)

    def initialize(
      @successful : Array(ChangeMessageVisibilityBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
