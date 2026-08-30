module Amazonite::DynamoDBV2
  class UpdateGlobalTableOutput
    include JSON::Serializable

    # Contains the details of the global table.
    @[JSON::Field(key: "GlobalTableDescription")]
    property global_table_description : GlobalTableDescription | Nil

    def initialize(
      @global_table_description : GlobalTableDescription | Nil = nil,
    )
    end
  end
end
