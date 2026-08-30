module Amazonite::DynamoDBV2
  # Provides visibility into the number of read and write operations your table or secondary index
  # can instantaneously support. The settings can be modified using the `UpdateTable` operation to
  # meet the throughput requirements of an upcoming peak event.
  class WarmThroughput
    include JSON::Serializable

    # Represents the number of read operations your base table can instantaneously support.
    @[JSON::Field(key: "ReadUnitsPerSecond")]
    property read_units_per_second : Int64 | Nil

    # Represents the number of write operations your base table can instantaneously support.
    @[JSON::Field(key: "WriteUnitsPerSecond")]
    property write_units_per_second : Int64 | Nil

    def initialize(
      @read_units_per_second : Int64 | Nil = nil,
      @write_units_per_second : Int64 | Nil = nil,
    )
    end

    def_equals_and_hash(@read_units_per_second, @write_units_per_second)
  end
end
