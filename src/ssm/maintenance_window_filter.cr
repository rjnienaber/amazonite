private alias Core = Amazonite::Core

module Amazonite::Ssm
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

    def validate! : Nil
      if value = @key
        raise Core::ValidationError.new("Key length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("Key length must be <= 128") if value.size > 128
      end
    end

    def_equals_and_hash(@key, @values)
  end
end
