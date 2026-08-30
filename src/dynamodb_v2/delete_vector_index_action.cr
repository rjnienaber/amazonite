module Amazonite::DynamoDBV2
  # A vector index to be removed from a table.
  class DeleteVectorIndexAction
    include JSON::Serializable

    # The name of the vector index to delete.
    @[JSON::Field(key: "IndexName")]
    property index_name : String

    def initialize(
      @index_name : String,
    )
    end

    def_equals_and_hash(@index_name)
  end
end
