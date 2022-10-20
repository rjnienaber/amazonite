module Amazonite::DynamoDBv2
  class ProvisionedThroughput
    include JSON::Serializable

    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Int64

    @[JSON::Field(key: "WriteCapacityUnits")]
    property write_capacity_units : Int64

    def initialize(
      @read_capacity_units : Int64,
      @write_capacity_units : Int64
    )
    end
  end
end