module Amazonite::DynamoDBV2
  # Represents a global secondary index to be deleted from an existing table.
  class DeleteGlobalSecondaryIndexAction
    include JSON::Serializable

    # The name of the global secondary index to be deleted.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    def initialize(
      @index_name : String,
    )
    end
  end
end
