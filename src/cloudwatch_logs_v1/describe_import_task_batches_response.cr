private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogsV1
  class DescribeImportTaskBatchesResponse
    include JSON::Serializable

    # The ARN of the source being imported from.
    @[JSON::Field(key: "importSourceArn")]
    property import_source_arn : String | Nil

    # The ID of the import task.
    @[JSON::Field(key: "importId")]
    property import_id : String | Nil

    # The list of import batches that match the request filters.
    @[JSON::Field(key: "importBatches")]
    property import_batches : Array(ImportBatch) | Nil

    # The token to use when requesting the next set of results. Not present if there are no additional
    # results to retrieve.
    @[JSON::Field(key: "nextToken")]
    property next_token : String | Nil

    def initialize(
      @import_source_arn : String | Nil = nil,
      @import_id : String | Nil = nil,
      @import_batches : Array(ImportBatch) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @import_id
        raise Core::ValidationError.new("importId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("importId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("importId does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-zA-Z0-9]+$"))
      end

      if value = @import_batches
        value.each(&.validate!)
      end

      if value = @next_token
        raise Core::ValidationError.new("nextToken length must be >= 1") if value.size < 1
      end
    end

    def_equals_and_hash(@import_source_arn, @import_id, @import_batches, @next_token)
  end
end
