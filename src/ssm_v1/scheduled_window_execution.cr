module Amazonite::SsmV1
  # Information about a scheduled execution for a maintenance window.
  class ScheduledWindowExecution
    include JSON::Serializable

    # The ID of the maintenance window to be run.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The name of the maintenance window to be run.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The time, in ISO-8601 Extended format, that the maintenance window is scheduled to be run.
    @[JSON::Field(key: "ExecutionTime")]
    property execution_time : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil,
      @execution_time : String | Nil = nil,
    )
    end

    def_equals_and_hash(@window_id, @name, @execution_time)
  end
end
