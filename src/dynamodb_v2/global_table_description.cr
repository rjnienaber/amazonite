private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Contains details about the global table.
  class GlobalTableDescription
    include JSON::Serializable

    # The Regions where the global table has replicas.
    @[JSON::Field(key: "ReplicationGroup")]
    property replication_group : Array(ReplicaDescription) | Nil

    # The unique identifier of the global table.
    @[JSON::Field(key: "GlobalTableArn")]
    property global_table_arn : String | Nil

    # The creation time of the global table.
    @[JSON::Field(key: "CreationDateTime", converter: Core::AWSEpochConverter)]
    property creation_date_time : Time | Nil

    # The current state of the global table:
    #
    # - `CREATING` - The global table is being created.
    #
    # - `UPDATING` - The global table is being updated.
    #
    # - `DELETING` - The global table is being deleted.
    #
    # - `ACTIVE` - The global table is ready for use.
    @[JSON::Field(key: "GlobalTableStatus", converter: ADDB::GlobalTableStatus)]
    property global_table_status : GlobalTableStatus | Nil

    # The global table name.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String | Nil

    def initialize(
      @replication_group : Array(ReplicaDescription) | Nil = nil,
      @global_table_arn : String | Nil = nil,
      @creation_date_time : Time | Nil = nil,
      @global_table_status : GlobalTableStatus | Nil = nil,
      @global_table_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @replication_group
        value.each(&.validate!)
      end

      if value = @global_table_name
        raise Core::ValidationError.new("GlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("GlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("GlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@replication_group, @global_table_arn, @creation_date_time, @global_table_status, @global_table_name)
  end
end
