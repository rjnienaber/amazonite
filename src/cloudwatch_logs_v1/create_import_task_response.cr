module Amazonite::CloudWatchLogsV1
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
  end
end
