module Amazonite::DynamoDBV2
  class CreateGlobalTableOutput
    include JSON::Serializable

    @[JSON::Field(key: "GlobalTableDescription")]
    property global_table_description : GlobalTableDescription | Nil

    def initialize(
      @global_table_description : GlobalTableDescription | Nil = nil
    )
    end
  end
end
