module Amazonite::DynamoDBV2
  class PointInTimeRecoverySpecification
    include JSON::Serializable

    @[JSON::Field(key: "PointInTimeRecoveryEnabled")]
    property point_in_time_recovery_enabled : Bool

    def initialize(
      @point_in_time_recovery_enabled : Bool
    )
    end
  end
end
