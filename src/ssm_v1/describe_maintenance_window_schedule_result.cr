module Amazonite::SsmV1
  class DescribeMaintenanceWindowScheduleResult
    include JSON::Serializable

    @[JSON::Field(key: "ScheduledWindowExecutions")]
    property scheduled_window_executions : Array(ScheduledWindowExecution) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @scheduled_window_executions : Array(ScheduledWindowExecution) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
