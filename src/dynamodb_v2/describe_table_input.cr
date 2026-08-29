module Amazonite::DynamoDBV2
  # Represents the input of a `DescribeTable` operation.
  class DescribeTableInput
    include JSON::Serializable

    # The name of the table to describe. You can also provide the Amazon Resource Name (ARN) of the
    # table in this parameter.
    @[JSON::Field(key: "TableName")]
    property table_name : String

    def initialize(
      @table_name : String,
    )
    end
  end
end
