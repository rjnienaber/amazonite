module Amazonite::DynamoDBV2
  class ListGlobalTablesInput
    include JSON::Serializable

    @[JSON::Field(key: "ExclusiveStartGlobalTableName")]
    property exclusive_start_global_table_name : String | Nil

    @[JSON::Field(key: "Limit")]
    property limit : Int32 | Nil

    @[JSON::Field(key: "RegionName")]
    property region_name : String | Nil

    def initialize(
      @exclusive_start_global_table_name : String | Nil = nil,
      @limit : Int32 | Nil = nil,
      @region_name : String | Nil = nil
    )
    end
  end
end
