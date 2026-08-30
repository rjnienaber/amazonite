private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # A collection of events being imported to CloudWatch
  class ImportBatch
    include JSON::Serializable

    # The unique identifier of the import batch.
    @[JSON::Field(key: "batchId")]
    property batch_id : String

    # The current status of the import batch. Valid values are IN_PROGRESS, CANCELLED, COMPLETED and
    # FAILED.
    @[JSON::Field(key: "status", converter: ACWL::ImportStatus)]
    property status : ImportStatus

    # The error message if the batch failed to import. Only present when status is FAILED.
    @[JSON::Field(key: "errorMessage")]
    property error_message : String | Nil

    def initialize(
      @batch_id : String,
      @status : ImportStatus,
      @error_message : String | Nil = nil,
    )
    end
  end
end
