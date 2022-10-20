module Amazonite::DynamoDBv2
  class ProvisionedThroughputOverride
    include JSON::Serializable

    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Int64 | Nil

    def initialize(
      @read_capacity_units : Int64 | Nil = nil
    )
    end
  end
end