private alias ADDB = Amazonite::DynamoDB
private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  # Represents the auto scaling configuration for a global table.
  class TableAutoScalingDescription
    include JSON::Serializable

    # The name of the table.
    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    # The current state of the table:
    #
    # - `CREATING` - The table is being created.
    #
    # - `UPDATING` - The table is being updated.
    #
    # - `DELETING` - The table is being deleted.
    #
    # - `ACTIVE` - The table is ready for use.
    @[JSON::Field(key: "TableStatus", converter: ADDB::TableStatus)]
    property table_status : TableStatus | Nil

    # Represents replicas of the global table.
    @[JSON::Field(key: "Replicas")]
    property replicas : Array(ReplicaAutoScalingDescription) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @table_status : TableStatus | Nil = nil,
      @replicas : Array(ReplicaAutoScalingDescription) | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("TableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("TableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end

      if value = @replicas
        value.each(&.validate!)
      end
    end

    def_equals_and_hash(@table_name, @table_status, @replicas)
  end
end
