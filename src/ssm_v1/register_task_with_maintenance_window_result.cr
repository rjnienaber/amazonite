private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class RegisterTaskWithMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the task in the maintenance window.
    @[JSON::Field(key: "WindowTaskId")]
    property window_task_id : String | Nil

    def initialize(
      @window_task_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_task_id
        raise Core::ValidationError.new("WindowTaskId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowTaskId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowTaskId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end
    end

    def_equals_and_hash(@window_task_id)
  end
end
