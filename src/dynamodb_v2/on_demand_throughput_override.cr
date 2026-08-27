module Amazonite::DynamoDBV2
  class OnDemandThroughputOverride
    include JSON::Serializable

    @[JSON::Field(key: "MaxReadRequestUnits")]
    property max_read_request_units : Int64 | Nil

    def initialize(
      @max_read_request_units : Int64 | Nil = nil,
    )
    end
  end
end
