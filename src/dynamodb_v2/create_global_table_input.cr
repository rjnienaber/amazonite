module Amazonite::DynamoDBV2
  class CreateGlobalTableInput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    @[JSON::Field(key: "ReplicationGroup")]
    property replication_group : Array(Replica)

    def initialize(
      @global_table_name : String,
      @replication_group : Array(Replica)
    )
    end
  end
end
