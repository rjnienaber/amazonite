private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Replica-specific provisioned throughput settings. If not specified, uses the source table's
  # provisioned throughput settings.
  class ProvisionedThroughputOverride
    include JSON::Serializable

    # Replica-specific read capacity units. If not specified, uses the source table's read capacity
    # settings.
    @[JSON::Field(key: "ReadCapacityUnits")]
    property read_capacity_units : Int64 | Nil

    def initialize(
      @read_capacity_units : Int64 | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @read_capacity_units
        raise Core::ValidationError.new("ReadCapacityUnits value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@read_capacity_units)
  end
end
