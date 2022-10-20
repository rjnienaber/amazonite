module Amazonite::DynamoDBv2
  class UpdateContinuousBackupsInput
    include JSON::Serializable

    @[JSON::Field(key: "TableName")]
    property table_name : String

    @[JSON::Field(key: "PointInTimeRecoverySpecification")]
    property point_in_time_recovery_specification : PointInTimeRecoverySpecification

    def initialize(
      @table_name : String,
      @point_in_time_recovery_specification : PointInTimeRecoverySpecification
    )
    end
  end
end