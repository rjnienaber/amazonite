module Amazonite::DynamoDBV2
  class DescribeGlobalTableSettingsInput
    include JSON::Serializable

    # The name of the global table to describe.
    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    def initialize(
      @global_table_name : String,
    )
    end
  end
end
