private alias Core = Amazonite::Core

module Amazonite::CloudWatchLogs
  class CreateImportTaskResponse
    include JSON::Serializable

    # A unique identifier for the import task.
    @[JSON::Field(key: "importId")]
    property import_id : String | Nil

    # The ARN of the CloudWatch Logs log group created as the destination for the imported events.
    @[JSON::Field(key: "importDestinationArn")]
    property import_destination_arn : String | Nil

    # The timestamp when the import task was created, expressed as the number of milliseconds after
    # Jan 1, 1970 00:00:00 UTC.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    def initialize(
      @import_id : String | Nil = nil,
      @import_destination_arn : String | Nil = nil,
      @creation_time : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @import_id
        raise Core::ValidationError.new("importId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("importId length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("importId does not match the required pattern") unless value.matches?(Regex.new("^[\\-a-zA-Z0-9]+$"))
      end

      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@import_id, @import_destination_arn, @creation_time)
  end
end
