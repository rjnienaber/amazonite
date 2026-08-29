module Amazonite::SqsV1
  # For each message in the batch, the response contains a ` DeleteMessageBatchResultEntry ` tag if
  # the message is deleted or a ` BatchResultErrorEntry ` tag if the message can't be deleted.
  class DeleteMessageBatchResult
    include JSON::Serializable

    # A list of ` DeleteMessageBatchResultEntry ` items.
    @[JSON::Field(key: "Successful")]
    property successful : Array(DeleteMessageBatchResultEntry) = [] of DeleteMessageBatchResultEntry

    # A list of ` BatchResultErrorEntry ` items.
    @[JSON::Field(key: "Failed")]
    property failed : Array(BatchResultErrorEntry) = [] of BatchResultErrorEntry

    def initialize(
      @successful : Array(DeleteMessageBatchResultEntry),
      @failed : Array(BatchResultErrorEntry),
    )
    end
  end
end
