private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeImportTaskBatchesRequest
    include JSON::Serializable

    # The ID of the import task to get batch information for.
    @[JSON::Field(key: "importId")]
    property import_id : String

    # Optional filter to list import batches by their status. Accepts multiple status values:
    # IN_PROGRESS, CANCELLED, COMPLETED and FAILED.
    @[JSON::Field(key: "batchImportStatus", converter: Core::ArrayConverter(ACWL::ImportStatus))]
    property batch_import_status : Array(ImportStatus) | Nil

    # The maximum number of import batches to return in the response. Default: 10
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # The pagination token for the next set of results.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @import_id : String,
      @batch_import_status : Array(ImportStatus) | Nil = nil,
      @limit : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
