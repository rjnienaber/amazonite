module Amazonite::DynamoDBV2
  # Represents the output of a `CreateTable` operation.
  class CreateTableOutput
    include JSON::Serializable

    # Represents the properties of the table.
    @[JSON::Field(key: "TableDescription")]
    property table_description : TableDescription | Nil

    def initialize(
      @table_description : TableDescription | Nil = nil,
    )
    end
  end
end
