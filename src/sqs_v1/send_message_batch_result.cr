module Amazonite::SqsV1
  # For each message in the batch, the response contains a ` SendMessageBatchResultEntry ` tag if
  # the message succeeds or a ` BatchResultErrorEntry ` tag if the message fails.
  class SendMessageBatchResult
    include JSON::Serializable

    # A list of ` SendMessageBatchResultEntry ` items.
    @[JSON::Field(key: "Successful")]
    property successful : Array(SendMessageBatchResultEntry) = [] of SendMessageBatchResultEntry

    # A list of ` BatchResultErrorEntry ` items with error details about each message that can't be
    # enqueued.
    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry) = [] of BatchResultErrorEntry

    def initialize(
      @successful : Array(SendMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end

    def_equals_and_hash(@successful, @failed)
  end
end
