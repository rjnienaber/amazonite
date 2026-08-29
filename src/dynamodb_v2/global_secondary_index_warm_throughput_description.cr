private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class GlobalSecondaryIndexWarmThroughputDescription
    include JSON::Serializable

    @[JSON::Field(key: "ReadUnitsPerSecond")]
    property read_units_per_second : Int64 | Nil

    @[JSON::Field(key: "WriteUnitsPerSecond")]
    property write_units_per_second : Int64 | Nil

    @[JSON::Field(key: "Status", converter: ADDB::IndexStatus)]
    property status : IndexStatus | Nil

    def initialize(
      @read_units_per_second : Int64 | Nil = nil,
      @write_units_per_second : Int64 | Nil = nil,
      @status : IndexStatus | Nil = nil,
    )
    end
  end
end
