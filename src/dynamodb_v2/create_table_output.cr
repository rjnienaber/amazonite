module Amazonite::DynamoDBv2
  class CreateTableOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableDescription")]
    property table_description : TableDescription | Nil

    def initialize(
      @table_description : TableDescription | Nil = nil
    )
    end
  end
end
