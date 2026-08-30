private alias Core = Amazonite::Core

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

    def validate! : Nil
      if value = @global_table_name
        raise Core::ValidationError.new("GlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("GlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("GlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @replication_group
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@global_table_name, @replication_group)
  end
end
