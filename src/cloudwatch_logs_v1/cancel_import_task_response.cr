private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  class CancelImportTaskResponse
    include JSON::Serializable

    # The ID of the cancelled import task.
    @[JSON::Field(key: "importId")]
    property import_id : String | Nil

    # Statistics about the import progress at the time of cancellation.
    @[JSON::Field(key: "importStatistics")]
    property import_statistics : ImportStatistics | Nil

    # The final status of the import task. This will be set to CANCELLED.
    @[JSON::Field(key: "importStatus", converter: ACWL::ImportStatus)]
    property import_status : ImportStatus | Nil

    # The timestamp when the import task was created, expressed as the number of milliseconds after
    # Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The timestamp when the import task was cancelled, expressed as the number of milliseconds after
    # Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    def initialize(
      @import_id : String | Nil = nil,
      @import_statistics : ImportStatistics | Nil = nil,
      @import_status : ImportStatus | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@import_id, @import_statistics, @import_status, @creation_time, @last_updated_time)
  end
end
