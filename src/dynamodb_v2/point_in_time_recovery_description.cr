private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class PointInTimeRecoveryDescription
    include JSON::Serializable

    @[JSON::Field(key: "PointInTimeRecoveryStatus", converter: ADDB::PointInTimeRecoveryStatus)]
    property point_in_time_recovery_status : PointInTimeRecoveryStatus | Nil

    @[JSON::Field(key: "EarliestRestorableDateTime", converter: Core::AWSEpochConverter)]
    property earliest_restorable_date_time : Time | Nil

    @[JSON::Field(key: "LatestRestorableDateTime", converter: Core::AWSEpochConverter)]
    property latest_restorable_date_time : Time | Nil

    def initialize(
      @point_in_time_recovery_status : PointInTimeRecoveryStatus | Nil = nil,
      @earliest_restorable_date_time : Time | Nil = nil,
      @latest_restorable_date_time : Time | Nil = nil
    )
    end
  end
end
