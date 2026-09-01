private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @batch_id
        raise Core::ValidationError.new("batchId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("batchId length must be <= 256") if value.size > 256
      end
    end

    def_equals_and_hash(@batch_id, @status, @error_message)
  end
end
