private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class PointInTimeRecoveryDescription
    include JSON::Serializable

    @[JSON::Field(key: "PointInTimeRecoveryStatus", converter: ADDB::PointInTimeRecoveryStatus)]
    property point_in_time_recovery_status : PointInTimeRecoveryStatus | Nil

    @[JSON::Field(key: "EarliestRestorableDateTime", converter: AC::AWSEpochConverter)]
    property earliest_restorable_date_time : Time | Nil

    @[JSON::Field(key: "LatestRestorableDateTime", converter: AC::AWSEpochConverter)]
    property latest_restorable_date_time : Time | Nil

    def initialize(
      @point_in_time_recovery_status : PointInTimeRecoveryStatus | Nil = nil,
      @earliest_restorable_date_time : Time | Nil = nil,
      @latest_restorable_date_time : Time | Nil = nil
    )
    end
  end
end
