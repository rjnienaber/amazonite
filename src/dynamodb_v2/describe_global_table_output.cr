module Amazonite::DynamoDBv2
  class DescribeGlobalTableOutput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableDescription")]
    property global_table_description : GlobalTableDescription | Nil

    def initialize(
      @global_table_description : GlobalTableDescription | Nil = nil
    )
    end
  end
end