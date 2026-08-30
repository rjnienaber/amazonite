module Amazonite::DynamoDBV2
  class DescribeTimeToLiveOutput
    include JSON::Serializable

    @[JSON::Field(key: "TimeToLiveDescription")]
    property time_to_live_description : TimeToLiveDescription | Nil

    def initialize(
      @time_to_live_description : TimeToLiveDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@time_to_live_description)
  end
end
