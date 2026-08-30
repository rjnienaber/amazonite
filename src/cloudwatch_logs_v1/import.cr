private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  # An import job to move data from CloudTrail Event Data Store to CloudWatch.
  class Import
    include JSON::Serializable

    # The unique identifier of the import task.
    @[JSON::Field(key: "importId")]
    property import_id : String | Nil

    # The ARN of the CloudTrail Lake Event Data Store being imported from.
    @[JSON::Field(key: "importSourceArn")]
    property import_source_arn : String | Nil

    # The current status of the import task. Valid values are IN_PROGRESS, CANCELLED, COMPLETED and
    # FAILED.
    @[JSON::Field(key: "importStatus", converter: ACWL::ImportStatus)]
    property import_status : ImportStatus | Nil

    # The ARN of the managed CloudWatch Logs log group where the events are being imported to.
    @[JSON::Field(key: "importDestinationArn")]
    property import_destination_arn : String | Nil

    # Statistics about the import progress
    @[JSON::Field(key: "importStatistics")]
    property import_statistics : ImportStatistics | Nil

    # The filter criteria used for this import task.
    @[JSON::Field(key: "importFilter")]
    property import_filter : ImportFilter | Nil

    # The timestamp when the import task was created, expressed as the number of milliseconds after
    # Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The timestamp when the import task was last updated, expressed as the number of milliseconds
    # after Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "lastUpdatedTime")]
    property last_updated_time : Int64 | Nil

    # Error message related to any failed imports
    @[JSON::Field(key: "errorMessage")]
    property error_message : String | Nil

    def initialize(
      @import_id : String | Nil = nil,
      @import_source_arn : String | Nil = nil,
      @import_status : ImportStatus | Nil = nil,
      @import_destination_arn : String | Nil = nil,
      @import_statistics : ImportStatistics | Nil = nil,
      @import_filter : ImportFilter | Nil = nil,
      @creation_time : Int64 | Nil = nil,
      @last_updated_time : Int64 | Nil = nil,
      @error_message : String | Nil = nil,
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

      if value = @import_filter
        value.validate!
      end

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @last_updated_time
        raise Core::ValidationError.new("lastUpdatedTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@import_id, @import_source_arn, @import_status, @import_destination_arn, @import_statistics, @import_filter, @creation_time, @last_updated_time, @error_message)
  end
end
