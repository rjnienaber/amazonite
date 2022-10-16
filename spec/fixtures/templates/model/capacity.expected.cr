module Amazonite::DynamoDBv2
  class Capacity
    include JSON::Serializable

    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Float64 | Nil

    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Float64 | Nil

    @[JSON::Field(key: "CapacityUnits")]
    property capacity_units : Float64 | Nil

    def initialize(
      @read_capacity_units : Float64 | Nil = nil,
      @write_capacity_units : Float64 | Nil = nil,
      @capacity_units : Float64 | Nil = nil
    )
    end
  end
end
