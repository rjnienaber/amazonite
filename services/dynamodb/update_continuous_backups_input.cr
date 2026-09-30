private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @point_in_time_recovery_specification
        value.validate!
      end
    end

    def_equals_and_hash(@table_name, @point_in_time_recovery_specification)
  end
end
