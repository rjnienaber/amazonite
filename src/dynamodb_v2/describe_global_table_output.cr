private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class DescribeGlobalTableOutput
    include JSON::Serializable

    # Contains the details of the global table.
    @[JSON::Field(key: "GlobalTableDescription")]
    property global_table_description : GlobalTableDescription | Nil

    def initialize(
      @global_table_description : GlobalTableDescription | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @global_table_description
        value.validate!
      end
    end

    def_equals_and_hash(@global_table_description)
  end
end
