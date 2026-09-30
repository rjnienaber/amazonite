private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetMaintenanceWindowExecutionTaskInvocationRequest
    include JSON::Serializable

    # The ID of the maintenance window execution for which the task is a part.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    # The ID of the specific task in the maintenance window task that should be retrieved.
    @[JSON::Field(key: "TaskId")]
    property task_id : String

    # The invocation ID to retrieve.
    @[JSON::Field(key: "InvocationId")]
    property invocation_id : String

    def initialize(
      @window_execution_id : String,
      @task_id : String,
      @invocation_id : String,
    )
    end

    def validate! : Nil
      if value = @window_execution_id
        raise Core::ValidationError.new("WindowExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowExecutionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @task_id
        raise Core::ValidationError.new("TaskId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("TaskId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("TaskId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end

      if value = @invocation_id
        raise Core::ValidationError.new("InvocationId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("InvocationId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("InvocationId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end
    end

    def_equals_and_hash(@window_execution_id, @task_id, @invocation_id)
  end
end
