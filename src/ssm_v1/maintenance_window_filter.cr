module Amazonite::SsmV1
  # Filter used in the request. Supported filter keys depend on the API operation that includes the
  # filter. API operations that use `MaintenanceWindowFilter>` include the following:
  #
  # - DescribeMaintenanceWindowExecutions
  #
  # - DescribeMaintenanceWindowExecutionTaskInvocations
  #
  # - DescribeMaintenanceWindowExecutionTasks
  #
  # - DescribeMaintenanceWindows
  #
  # - DescribeMaintenanceWindowTargets
  #
  # - DescribeMaintenanceWindowTasks
  class MaintenanceWindowFilter
    include JSON::Serializable

    # The name of the filter.
    @[JSON::Field(key: "Key")]
    property key : String | Nil

    # The filter values.
    @[JSON::Field(key: "Values")]
    property values : Array(String) | Nil

    def initialize(
      @key : String | Nil = nil,
      @values : Array(String) | Nil = nil,
    )
    end

    def_equals_and_hash(@key, @values)
  end
end
