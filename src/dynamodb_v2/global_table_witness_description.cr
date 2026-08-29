private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the properties of a witness Region in a MRSC global table.
  class GlobalTableWitnessDescription
    include JSON::Serializable

    # The name of the Amazon Web Services Region that serves as a witness for the MRSC global table.
    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    # The current status of the witness Region in the MRSC global table.
    @[JSON::Field(key: "WitnessStatus", converter: ADDB::WitnessStatus)]
    property witness_status : WitnessStatus | Nil

    def initialize(
      @region_name : String | Nil = nil,
      @witness_status : WitnessStatus | Nil = nil,
    )
    end
  end
end
