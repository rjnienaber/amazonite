module Amazonite::DynamoDBv2
  class DescribeGlobalTableSettingsOutput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String | Nil

    @[JSON::Field(key: "ReplicaSettings")]
    property replica_settings : Array(ReplicaSettingsDescription) | Nil

    def initialize(
      @global_table_name : String | Nil = nil,
      @replica_settings : Array(ReplicaSettingsDescription) | Nil = nil
    )
    end
  end
end