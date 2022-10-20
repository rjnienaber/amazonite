module Amazonite::DynamoDBv2
  class ListTablesInput
    include JSON::Serializable

    @[JSON::Field(key: "ExclusiveStartTableName")]
    property exclusive_start_table_name : String | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    def initialize(
      @exclusive_start_table_name : String | Nil = nil,
      @limit : Int32 | Nil = nil
    )
    end
  end
end
