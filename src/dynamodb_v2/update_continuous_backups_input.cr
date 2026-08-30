module Amazonite::DynamoDBV2
  class UpdateContinuousBackupsInput
    include JSON::Serializable

    # The name of the table. You can also provide the Amazon Resource Name (ARN) of the table in this
    # parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # Represents the settings used to enable point in time recovery.
    @[JSON::Field(key: "PointInTimeRecoverySpecification")]
    property point_in_time_recovery_specification : PointInTimeRecoverySpecification

    def initialize(
      @table_name : String,
      @point_in_time_recovery_specification : PointInTimeRecoverySpecification,
    )
    end
  end
end
