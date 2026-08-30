private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # Represents the input of an `UpdateTimeToLive` operation.
  class UpdateTimeToLiveInput
    include JSON::Serializable

    # The name of the table to be configured. You can also provide the Amazon Resource Name (ARN) of
    # the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    # Represents the settings used to enable or disable Time to Live for the specified table.
    @[JSON::Field(key: "TimeToLiveSpecification")]
    property time_to_live_specification : TimeToLiveSpecification

    def initialize(
      @table_name : String,
      @time_to_live_specification : TimeToLiveSpecification,
    )
    end

    def validate! : Nil
      if value = @table_name
        raise Core::ValidationError.new("TableName length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("TableName length must be <= 1024") if value.size > 1024
      end

      if value = @time_to_live_specification
        value.validate!
      end
    end

    def_equals_and_hash(@table_name, @time_to_live_specification)
  end
end
