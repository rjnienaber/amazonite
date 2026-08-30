module Amazonite::DynamoDBV2
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
  end
end
