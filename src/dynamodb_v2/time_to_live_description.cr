private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # The description of the Time to Live (TTL) status on the specified table.
  class TimeToLiveDescription
    include JSON::Serializable

    # The TTL status for the table.
    @[JSON::Field(key: "TimeToLiveStatus", converter: ADDB::TimeToLiveStatus)]
    property time_to_live_status : TimeToLiveStatus | Nil

    # The name of the TTL attribute for items in the table.
    @[JSON::Field(key: "AttributeName")]
    property attribute_name : String | Nil

    def initialize(
      @time_to_live_status : TimeToLiveStatus | Nil = nil,
      @attribute_name : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @attribute_name
        raise Core::ValidationError.new("AttributeName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("AttributeName length must be <= 255") if value.size > 255
      end
    end

    def_equals_and_hash(@time_to_live_status, @attribute_name)
  end
end
