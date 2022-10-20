module Amazonite::DynamoDBv2
  class UpdateTableOutput
    include JSON::Serializable

    @[JSON::Field(key: "TableDescription")]
    property table_description : TableDescription | Nil

    def initialize(
      @table_description : TableDescription | Nil = nil
    )
    end
  end
end