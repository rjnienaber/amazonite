module Amazonite::DynamoDBV2
  class UpdateTimeToLiveOutput
    include JSON::Serializable

    # Represents the output of an `UpdateTimeToLive` operation.
    @[JSON::Field(key: "TimeToLiveSpecification")]
    property time_to_live_specification : TimeToLiveSpecification | Nil

    def initialize(
      @time_to_live_specification : TimeToLiveSpecification | Nil = nil,
    )
    end

    def_equals_and_hash(@time_to_live_specification)
  end
end
