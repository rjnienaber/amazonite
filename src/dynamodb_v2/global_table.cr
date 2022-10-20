module Amazonite::DynamoDBv2
  class GlobalTable
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String | Nil

    @[JSON::Field(key: "ReplicationGroup")]
    property replication_group : Array(Replica) | Nil

    def initialize(
      @global_table_name : String | Nil = nil,
      @replication_group : Array(Replica) | Nil = nil
    )
    end
  end
end
