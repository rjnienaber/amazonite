module Amazonite::DynamoDBv2
  class DescribeGlobalTableInput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableName")]
    property global_table_name : String

    def initialize(
      @global_table_name : String
    )
    end
  end
end