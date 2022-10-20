module Amazonite::DynamoDBv2
  class DeleteGlobalSecondaryIndexAction
    include JSON::Serializable

    @[JSON::Field(key: "IndexName")]
    property index_name : String

    def initialize(
      @index_name : String
    )
    end
  end
end
