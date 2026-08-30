private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the warm throughput value (in read units per second and write units per second) of
  # the table. Warm throughput is applicable for DynamoDB Standard-IA tables and specifies the
  # minimum provisioned capacity maintained for immediate data access.
  class TableWarmThroughputDescription
    include JSON::Serializable

    # Represents the base table's warm throughput value in read units per second.
    @[JSON::Field(key: "ReadUnitsPerSecond")]
    property read_units_per_second : Int64 | Nil

    # Represents the base table's warm throughput value in write units per second.
    @[JSON::Field(key: "WriteUnitsPerSecond")]
    property write_units_per_second : Int64 | Nil

    # Represents warm throughput value of the base table.
    @[JSON::Field(key: "Status", converter: ADDB::TableStatus)]
    property status : TableStatus | Nil

    def initialize(
      @read_units_per_second : Int64 | Nil = nil,
      @write_units_per_second : Int64 | Nil = nil,
      @status : TableStatus | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @read_units_per_second
        raise Core::ValidationError.new("ReadUnitsPerSecond value must be >= 1") if value < 1
      end

      if value = @write_units_per_second
        raise Core::ValidationError.new("WriteUnitsPerSecond value must be >= 1") if value < 1
      end
    end

    def_equals_and_hash(@read_units_per_second, @write_units_per_second, @status)
  end
end
