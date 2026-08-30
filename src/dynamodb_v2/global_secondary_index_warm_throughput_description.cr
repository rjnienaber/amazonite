private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # The description of the warm throughput value on a global secondary index.
  class GlobalSecondaryIndexWarmThroughputDescription
    include JSON::Serializable

    # Represents warm throughput read units per second value for a global secondary index.
    @[JSON::Field(key: "ReadUnitsPerSecond")]
    property read_units_per_second : Int64 | Nil

    # Represents warm throughput write units per second value for a global secondary index.
    @[JSON::Field(key: "WriteUnitsPerSecond")]
    property write_units_per_second : Int64 | Nil

    # Represents the warm throughput status being created or updated on a global secondary index. The
    # status can only be `UPDATING` or `ACTIVE`.
    @[JSON::Field(key: "Status", converter: ADDB::IndexStatus)]
    property status : IndexStatus | Nil

    def initialize(
      @read_units_per_second : Int64 | Nil = nil,
      @write_units_per_second : Int64 | Nil = nil,
      @status : IndexStatus | Nil = nil,
    )
    end

    def_equals_and_hash(@read_units_per_second, @write_units_per_second, @status)
  end
end
