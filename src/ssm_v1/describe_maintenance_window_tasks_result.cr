module Amazonite::SsmV1
  class DescribeMaintenanceWindowTasksResult
    include JSON::Serializable

    @[JSON::Field(key: "Tasks")]
    property tasks : Array(MaintenanceWindowTask) | Nil

    @[JSON::Field(key: "NextToken")]
    property next_token : String | Nil

    def initialize(
      @tasks : Array(MaintenanceWindowTask) | Nil = nil,
      @next_token : String | Nil = nil
    )
    end
  end
end
