module Amazonite::SsmV1
  class DescribeMaintenanceWindowTasksResult
    include JSON::Serializable

    # Information about the tasks in the maintenance window.
    @[JSON::Field(key: "Tasks")]
    property tasks : Array(MaintenanceWindowTask) | Nil

    # The token to use when requesting the next set of items. If there are no additional items to
    # return, the string is empty.
    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @tasks : Array(MaintenanceWindowTask) | Nil = nil,
      @next_token : String | Nil = nil,
    )
    end
  end
end
