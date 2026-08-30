private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class DescribeMaintenanceWindowScheduleResult
    include JSON::Serializable

    # Information about maintenance window executions scheduled for the specified time range.
    @[JSON::Field(key: "ScheduledWindowExecutions")]
    property scheduled_window_executions : Array(ScheduledWindowExecution) | Nil

    # The token for the next set of items to return. (You use this token in the next call.)
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @scheduled_window_executions : Array(ScheduledWindowExecution) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @scheduled_window_executions
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@scheduled_window_executions, @next_token)
  end
end
