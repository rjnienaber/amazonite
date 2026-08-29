private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class TableWarmThroughputDescription
    include JSON::Serializable

    @[JSON::Field(key: "ReadUnitsPerSecond")]
    property read_units_per_second : Int64 | Nil

    @[JSON::Field(key: "WriteUnitsPerSecond")]
    property write_units_per_second : Int64 | Nil

    @[JSON::Field(key: "Status", converter: ADDB::TableStatus)]
    property status : TableStatus | Nil

    def initialize(
      @read_units_per_second : Int64 | Nil = nil,
      @write_units_per_second : Int64 | Nil = nil,
      @status : TableStatus | Nil = nil,
    )
    end
  end
end
