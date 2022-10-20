module Amazonite::DynamoDBv2
  class DescribeTableOutput
    include JSON::Serializable

    @[JSON::Field(key: "Table")]
    property table : TableDescription | Nil

    def initialize(
      @table : TableDescription | Nil = nil
    )
    end
  end
end
