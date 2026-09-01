private alias Core = Amazonite::Core

module Amazonite::DynamoDB
  class DescribeGlobalTableSettingsInput
    include JSON::Serializable

    # The name of the global table to describe.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    def initialize(
      @global_table_name : String,
    )
    end

    def validate! : Nil
      if value = @global_table_name
        raise Core::ValidationError.new("GlobalTableName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("GlobalTableName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("GlobalTableName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@global_table_name)
  end
end
