private alias ACWL = Amazonite::CloudWatchLogsV1
private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeImportTasksRequest
    include JSON::Serializable

    # Optional filter to describe a specific import task by its ID.
    @[JSON::Field(key: "importId")]
    property import_id : String | Nil

    # Optional filter to list imports by their status. Valid values are IN_PROGRESS, CANCELLED,
    # COMPLETED and FAILED.
    @[JSON::Field(key: "importStatus", converter: ACWL::ImportStatus)]
    property import_status : ImportStatus | Nil

    # Optional filter to list imports from a specific source
    @[JSON::Field(key: "importSourceArn")]
    property import_source_arn : String | Nil

    # The maximum number of import tasks to return in the response. Default: 50
    @[JSON::Field(key: "limit")]
    property limit : Int32 | Nil

    # The pagination token for the next set of results.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @import_id : String | Nil = nil,
      @import_status : ImportStatus | Nil = nil,
      @import_source_arn : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @import_id
        raise Core::ValidationError.new("importId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("importId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("importId does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-zA-Z0-9]+$"))
      end

      if value = @limit
        raise Core::ValidationError.new("limit value must be >= 1") if value < 1
        raise Core::ValidationError.new("limit value must be <= 50") if value > 50
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@import_id, @import_status, @import_source_arn, @limit, @next_token)
  end
end
