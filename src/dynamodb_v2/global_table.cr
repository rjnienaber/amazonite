module Amazonite::DynamoDBV2
  # Represents the properties of a global table.
  class GlobalTable
    include JSON::Serializable

    # The global table name.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String | Nil

    # The Regions where the global table has replicas.
    @[JSON::Field(key: "ReplicationGroup")]
    property replication_group : Array(Replica) | Nil

    def initialize(
      @global_table_name : String | Nil = nil,
      @replication_group : Array(Replica) | Nil = nil,
    )
    end
  end
end
