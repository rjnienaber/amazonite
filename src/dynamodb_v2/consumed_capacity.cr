module Amazonite::DynamoDBv2
  class ConsumedCapacity
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String | Nil

    @[JSON::Field(key: "CapacityUnits")]
    property capacity_units : Float64 | Nil

    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Float64 | Nil

    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Float64 | Nil

    @[JSON::Field(key: "Table")]
    property table : Capacity | Nil

    @[JSON::Field(key: "LocalSecondaryIndexes")]
    property local_secondary_indexes : Hash(String, Capacity) | Nil

    @[JSON::Field(key: "GlobalSecondaryIndexes")]
    property global_secondary_indexes : Hash(String, Capacity) | Nil

    def initialize(
      @table_name : String | Nil = nil,
      @capacity_units : Float64 | Nil = nil,
      @read_capacity_units : Float64 | Nil = nil,
      @write_capacity_units : Float64 | Nil = nil,
      @table : Capacity | Nil = nil,
      @local_secondary_indexes : Hash(String, Capacity) | Nil = nil,
      @global_secondary_indexes : Hash(String, Capacity) | Nil = nil
    )
    end
  end
end
