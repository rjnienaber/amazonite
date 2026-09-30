private alias Core = Amazonite::Core

module Amazonite::Ssm
  class RegisterTargetWithMaintenanceWindowResult
    include JSON::Serializable

    # The ID of the target definition in this maintenance window.
    @[JSON::Field(key: "WindowTargetId")]
    property window_target_id : String | Nil

    def initialize(
      @window_target_id : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_target_id
        raise Core::ValidationError.new("WindowTargetId length must be >= 36") if value.size < 36
        raise Core::ValidationError.new("WindowTargetId length must be <= 36") if value.size > 36
        raise Core::ValidationError.new("WindowTargetId does not match the required pattern") unless value.matches?(Regex.new("^[0-9a-fA-F]{8}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{4}\\-[0-9a-fA-F]{12}$"))
      end
    end

    def_equals_and_hash(@window_target_id)
  end
end
