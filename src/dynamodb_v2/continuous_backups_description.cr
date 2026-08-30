private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  # Represents the continuous backups and point in time recovery settings on the table.
  class ContinuousBackupsDescription
    include JSON::Serializable

    # `ContinuousBackupsStatus` can be one of the following states: ENABLED, DISABLED
    @[JSON::Field(key: "ContinuousBackupsStatus", converter: ADDB::ContinuousBackupsStatus)]
    property continuous_backups_status : ContinuousBackupsStatus

    # The description of the point in time recovery settings applied to the table.
    @[JSON::Field(key: "PointInTimeRecoveryDescription")]
    property point_in_time_recovery_description : PointInTimeRecoveryDescription | Nil

    def initialize(
      @continuous_backups_status : ContinuousBackupsStatus,
      @point_in_time_recovery_description : PointInTimeRecoveryDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@continuous_backups_status, @point_in_time_recovery_description)
  end
end
