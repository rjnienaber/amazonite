module Amazonite::DynamoDBV2
  class CreateGlobalTableInput
    include JSON::Serializable

    # The global table name.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    # The Regions where the global table needs to be created.
    @[JSON::Field(key: "ReplicationGroup")]
    property replication_group : Array(Replica) = [] of Replica

    def initialize(
      @global_table_name : String,
      @replication_group : Array(Replica),
    )
    end
  end
end
