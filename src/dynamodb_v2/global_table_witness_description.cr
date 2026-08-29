private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class GlobalTableWitnessDescription
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    @[JSON::Field(key: "WitnessStatus", converter: ADDB::WitnessStatus)]
    property witness_status : WitnessStatus | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @witness_status : WitnessStatus | Nil = nil,
    )
    end
  end
end
