private alias Core = Amazonite::Core

module Amazonite::EventBridge
  class RemovePermissionRequest
    include JSON::Serializable

    # The statement ID corresponding to the account that is no longer allowed to put events to the
    # default event bus.
    @[JSON::Field(key: "StatementId")]
    property statement_id : String | Nil

    # Specifies whether to remove all permissions.
    @[JSON::Field(key: "RemoveAllPermissions")]
    property remove_all_permissions : Bool | Nil

    # The name of the event bus to revoke permissions for. If you omit this, the default event bus is
    # used.
    @[JSON::Field(key: "EventBusName")]
    property event_bus_name : String | Nil

    def initialize(
      @statement_id : String | Nil = nil,
      @remove_all_permissions : Bool | Nil = nil,
      @event_bus_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @statement_id
        raise Core::ValidationError.new("StatementId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("StatementId length must be <= 64") if value.size > 64
        raise Core::ValidationError.new("StatementId does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9-_]+$"))
      end

      if value = @event_bus_name
        raise Core::ValidationError.new("EventBusName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("EventBusName length must be <= 256") if value.size > 256
        raise Core::ValidationError.new("EventBusName does not match the required pattern") unless value.matches?(Regex.new("^[\\.\\-_A-Za-z0-9]+$"))
      end
    end

    def_equals_and_hash(@statement_id, @remove_all_permissions, @event_bus_name)
  end
end
