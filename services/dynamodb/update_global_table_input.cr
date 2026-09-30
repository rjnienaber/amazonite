private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class UpdateGlobalTableInput
    include JSON::Serializable

    # The global table name.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    # A list of Regions that should be added or removed from the global table.
    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicaUpdate) = [] of ReplicaUpdate

    def initialize(
      @global_table_name : String,
      @replica_updates : Array(ReplicaUpdate),
    )
    end

    def validate! : Nil
      if value = @global_table_name
        raise Core::ValidationError.new("GlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("GlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("GlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @replica_updates
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@global_table_name, @replica_updates)
  end
end
