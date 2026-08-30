module Amazonite::DynamoDBV2
  # Represents the output of a `DescribeTable` operation.
  class DescribeTableOutput
    include JSON::Serializable

    # The properties of the table.
    @[JSON::Field(key: "Table")]
    property table : TableDescription | Nil

    def initialize(
      @table : TableDescription | Nil = nil,
    )
    end

    def_equals_and_hash(@table)
  end
end
