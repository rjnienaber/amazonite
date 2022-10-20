private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
  class ContinuousBackupsDescription
    include JSON::Serializable

    @[JSON::Field(key: "ContinuousBackupsStatus", converter: ADDB::ContinuousBackupsStatus)]
    property continuous_backups_status : ContinuousBackupsStatus

    @[JSON::Field(key: "PointInTimeRecoveryDescription")]
    property point_in_time_recovery_description : PointInTimeRecoveryDescription | Nil

    def initialize(
      @continuous_backups_status : ContinuousBackupsStatus,
      @point_in_time_recovery_description : PointInTimeRecoveryDescription | Nil = nil
    )
    end
  end
end