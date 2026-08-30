module Amazonite::DynamoDBV2
  # Represents the amount of provisioned throughput capacity consumed on a table or an index.
  class Capacity
    include JSON::Serializable

    # The total number of read capacity units consumed on a table or an index.
    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Float64 | Nil

    # The total number of write capacity units consumed on a table or an index.
    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Float64 | Nil

    # The total number of capacity units consumed on a table or an index.
    @[JSON::Field(key: "CapacityUnits")]
    property capacity_units : Float64 | Nil

    def initialize(
      @read_capacity_units : Float64 | Nil = nil,
      @write_capacity_units : Float64 | Nil = nil,
      @capacity_units : Float64 | Nil = nil,
    )
    end
  end
end
