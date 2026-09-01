private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeregisterTaskFromMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the maintenance window the task was removed from.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The ID of the task removed from the maintenance window.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @window_task_id : String | Nil = nil,
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
