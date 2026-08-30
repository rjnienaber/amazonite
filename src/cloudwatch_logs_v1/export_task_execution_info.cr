module Amazonite::CloudWatchLogsV1
  # Represents the status of an export task.
  class ExportTaskExecutionInfo
    include JSON::Serializable

    # The creation time of the export task, expressed as the number of milliseconds after `Jan 1, 1970
    # 00:00:00 UTC`.
    @[JSON::Field(key: "creationTime")]
    property creation_time : Int64 | Nil

    # The completion time of the export task, expressed as the number of milliseconds after `Jan 1,
    # 1970 00:00:00 UTC`.
    @[JSON::Field(key: "completionTime")]
    property completion_time : Int64 | Nil

    def initialize(
      @creation_time : Int64 | Nil = nil,
      @completion_time : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@creation_time, @completion_time)
  end
end
