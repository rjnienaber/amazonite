module Amazonite::DynamoDBv2
  class UpdateGlobalTableInput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    @[JSON::Field(key: "ReplicaUpdates")]
    property replica_updates : Array(ReplicaUpdate)

    def initialize(
      @global_table_name : String,
      @replica_updates : Array(ReplicaUpdate)
    )
    end
  end
end
