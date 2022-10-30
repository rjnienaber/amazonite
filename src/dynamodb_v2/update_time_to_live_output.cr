module Amazonite::DynamoDBV2
  class UpdateTimeToLiveOutput
    include JSON::Serializable

    @[JSON::Field(key: "TimeToLiveSpecification")]
    property time_to_live_specification : TimeToLiveSpecification | Nil

    def initialize(
      @time_to_live_specification : TimeToLiveSpecification | Nil = nil
    )
    end
  end
end
