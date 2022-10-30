private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class GlobalTableDescription
    include JSON::Serializable

    @[JSON::Field(key: "ReplicationGroup")]
    property replication_group : Array(ReplicaDescription) | Nil

    @[JSON::Field(key: "GlobalTableArn")]
    property global_table_arn : String | Nil

    @[JSON::Field(key: "CreationDateTime", converter: Core::AWSEpochConverter)]
    property creation_date_time : Time | Nil

    @[JSON::Field(key: "GlobalTableStatus", converter: ADDB::GlobalTableStatus)]
    property global_table_status : GlobalTableStatus | Nil

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String | Nil

    def initialize(
      @replication_group : Array(ReplicaDescription) | Nil = nil,
      @global_table_arn : String | Nil = nil,
      @creation_date_time : Time | Nil = nil,
      @global_table_status : GlobalTableStatus | Nil = nil,
      @global_table_name : String | Nil = nil
    )
    end
  end
end
