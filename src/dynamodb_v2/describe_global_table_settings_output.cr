module Amazonite::DynamoDBV2
  class DescribeGlobalTableSettingsOutput
    include JSON::Serializable

    # The name of the global table.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String | Nil

    # The Region-specific settings for the global table.
    @[JSON::Field(key: "ReplicaSettings")]
    property replica_settings : Array(ReplicaSettingsDescription) | Nil

    def initialize(
      @global_table_name : String | Nil = nil,
      @replica_settings : Array(ReplicaSettingsDescription) | Nil = nil,
    )
    end

    def_equals_and_hash(@global_table_name, @replica_settings)
  end
end
