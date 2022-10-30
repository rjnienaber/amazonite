private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class TableAutoScalingDescription
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "TableStatus", converter: ADDB::TableStatus)]
    property table_status : TableStatus | Nil

    @[JSON::Field(key: "Replicas")]
    property replicas : Array(ReplicaAutoScalingDescription) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @table_status : TableStatus | Nil = nil,
      @replicas : Array(ReplicaAutoScalingDescription) | Nil = nil
    )
    end
  end
end
