private alias ACWL = Amazonite::CloudWatchLogsV1

module Amazonite::CloudWatchLogsV1
  # Represents the status of an export task.
  class ExportTaskStatus
    include JSON::Serializable

    # The status code of the export task.
    @[JSON::Field(key: "code", converter: ACWL::ExportTaskStatusCode)]
    property code : ExportTaskStatusCode | Nil

    # The status message related to the status code.
    @[JSON::Field(key: "message")]
    property message : String | Nil

    def initialize(
      @code : ExportTaskStatusCode | Nil = nil,
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@code, @message)
  end
end
