private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  class TimeToLiveDescription
    include JSON::Serializable

    @[JSON::Field(key: "TimeToLiveStatus", converter: ADDB::TimeToLiveStatus)]
    property time_to_live_status : TimeToLiveStatus | Nil

    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String | Nil

    def initialize(
      @time_to_live_status : TimeToLiveStatus | Nil = nil,
      @attribute_name : String | Nil = nil
    )
    end
  end
end
