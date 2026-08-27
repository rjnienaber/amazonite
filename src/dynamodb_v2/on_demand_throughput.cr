module Amazonite::DynamoDBV2
  class OnDemandThroughput
    include JSON::Serializable

    @[JSON::Field(key: "MaxReadRequestUnits")]
    property max_read_request_units : Int64 | Nil

    @[JSON::Field(key: "MaxWriteRequestUnits")]
    property max_write_request_units : Int64 | Nil

    def initialize(
      @max_read_request_units : Int64 | Nil = nil,
      @max_write_request_units : Int64 | Nil = nil,
    )
    end
  end
end
