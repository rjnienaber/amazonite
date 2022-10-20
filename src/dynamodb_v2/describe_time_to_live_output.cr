module Amazonite::DynamoDBv2
  class DescribeTimeToLiveOutput
    include JSON::Serializable

    @[JSON::Field(key: "TimeToLiveDescription")]
    property time_to_live_description : TimeToLiveDescription | Nil

    def initialize(
      @time_to_live_description : TimeToLiveDescription | Nil = nil
    )
    end
  end
end