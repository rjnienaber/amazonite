private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @creation_time
        raise Core::ValidationError.new("creationTime value must be >= 0") if value < 0
      end

      if value = @completion_time
        raise Core::ValidationError.new("completionTime value must be >= 0") if value < 0
      end
    end

    def_equals_and_hash(@creation_time, @completion_time)
  end
end
