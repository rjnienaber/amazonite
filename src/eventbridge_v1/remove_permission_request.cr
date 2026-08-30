module Amazonite::EventBridgeV1
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

    def_equals_and_hash(@statement_id, @remove_all_permissions, @event_bus_name)
  end
end
