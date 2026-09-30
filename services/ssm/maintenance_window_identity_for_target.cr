private alias Core = Amazonite::Core

module Amazonite::Ssm
  # The maintenance window to which the specified target belongs.
  class MaintenanceWindowIdentityForTarget
    include JSON::Serializable

    # The ID of the maintenance window.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The name of the maintenance window.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @window_id
        raise Core::ValidationError.new("WindowId length must be >= 20") if value.size < 20
        raise Core::ValidationError.new("WindowId length must be <= 20") if value.size > 20
        raise Core::ValidationError.new("WindowId does not match the required pattern") unless value.matches?(Regex.new("^mw-[0-9a-f]{17}$"))
      end

      if value = @name
        raise Core::ValidationError.new("Name length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("Name length must be <= 128") if value.size > 128
        raise Core::ValidationError.new("Name does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_\\-.]{3,128}$"))
      end
    end

    def_equals_and_hash(@window_id, @name)
  end
end
