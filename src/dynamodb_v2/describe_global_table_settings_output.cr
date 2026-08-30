private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @global_table_name
        raise Core::ValidationError.new("GlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("GlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("GlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @replica_settings
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@global_table_name, @replica_settings)
  end
end
