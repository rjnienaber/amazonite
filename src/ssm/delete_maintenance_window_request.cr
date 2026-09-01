private alias Core = Amazonite::Core

module Amazonite::Ssm
  class DeleteMaintenanceWindowRequest
    include JSON::Serializable

    # The ID of the maintenance window to delete.
    @[JSON::Field(key: "WindowId")]
    property window_id : String

    def initialize(
      @window_id : String,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end
    end

    def_equals_and_hash(@window_id)
  end
end
