private alias Core = Amazonite::Core

module Amazonite::Ssm
  class GetMaintenanceWindowTaskRequest
    include JSON::Serializable

    # The maintenance window ID that includes the task to retrieve.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    # The maintenance window task ID to retrieve.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String

    def initialize(
      @window_id : String,
      @window_task_id : String,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @window_task_id
        raise Core::ValidationError.new("WindowTaskId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowTaskId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowTaskId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end
    end

    def_equals_and_hash(@window_id, @window_task_id)
  end
end
