module Amazonite::SsmV1
  class DescribeMaintenanceWindowExecutionsResult
    include JSON::Serializable

    @[JSON::Field(key: "WindowExecutions")]
    property window_executions : Array(MaintenanceWindowExecution) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @window_executions : Array(MaintenanceWindowExecution) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
