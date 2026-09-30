private alias Core = Amazonite::Core

module Amazonite::Ssm
  # Information about a scheduled execution for a maintenance window.
  class ScheduledWindowExecution
    include JSON::Serializable

    # The ID of the maintenance window to be run.
    @[JSON::Field(key: "WindowId")]
    property window_id : String | Nil

    # The name of the maintenance window to be run.
    @[JSON::Field(key: "Name")]
    property name : String | Nil

    # The time, in ISO-8601 Extended format, that the maintenance window is scheduled to be run.
    @[JSON::Field(key: "ExecutionTime")]
    property execution_time : String | Nil

    def initialize(
      @window_id : String | Nil = nil,
      @name : String | Nil = nil,
      @execution_time : String | Nil = nil,
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

    def_equals_and_hash(@window_id, @name, @execution_time)
  end
end
