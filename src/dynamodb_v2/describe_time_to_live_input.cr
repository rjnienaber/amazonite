module Amazonite::DynamoDBV2
  class DescribeTimeToLiveInput
    include JSON::Serializable

    # The name of the table to be described. You can also provide the Amazon Resource Name (ARN) of
    # the table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    def initialize(
      @table_name : String,
    )
    end

    def_equals_and_hash(@table_name)
  end
end
