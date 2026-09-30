private alias ACWL = Amazonite::CloudWatchLogs
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
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

    def validate! : Nil
      if value = @import_id
        raise Core::ValidationError.new("importId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("importId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("importId does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-zA-Z0-9]+$"))
      end

      if value = @import_statistics
        value.validate!
      end

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@import_id, @import_statistics, @import_status, @creation_time, @last_updated_time)
  end
end
