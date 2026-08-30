private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class GetMaintenanceWindowExecutionRequest
    include JSON::Serializable

    # The ID of the maintenance window execution that includes the task.
    @[JSON::Field(key: "WindowExecutionId")]
    property window_execution_id : String

    def initialize(
      @window_execution_id : String,
    )
    end

    def validate! : Nil
      if value = @window_execution_id
        raise Core::ValidationError.new("WindowExecutionId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowExecutionId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowExecutionId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end
    end

    def_equals_and_hash(@window_execution_id)
  end
end
