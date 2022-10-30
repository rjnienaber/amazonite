module Amazonite::DynamoDBV2
  class Replica
    include JSON::Serializable

    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    def initialize(
      @region_name : String | Nil = nil
    )
    end
  end
end
