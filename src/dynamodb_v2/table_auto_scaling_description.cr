private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
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
  end
end
