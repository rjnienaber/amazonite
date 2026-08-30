module Amazonite::SqsV1
  # For each message in the batch, the response contains a ` ChangeMessageVisibilityBatchResultEntry
  # ` tag if the message succeeds or a ` BatchResultErrorEntry ` tag if the message fails.
  class ChangeMessageVisibilityBatchResult
    include JSON::Serializable

    # A list of ` ChangeMessageVisibilityBatchResultEntry ` items.
    @[JSON::Field(key: "Successful")]
    property successful : Array(ChangeMessageVisibilityBatchResultEntry) = [] of ChangeMessageVisibilityBatchResultEntry

    # A list of ` BatchResultErrorEntry ` items.
    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry) = [] of BatchResultErrorEntry

    def initialize(
      @successful : Array(ChangeMessageVisibilityBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end

    def_equals_and_hash(@successful, @failed)
  end
end
