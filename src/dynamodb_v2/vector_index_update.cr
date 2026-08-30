private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  # A vector index to be added to or removed from a table.
  class VectorIndexUpdate
    include JSON::Serializable

    # The configuration for creating a new vector index on the table.
    @[JSON::Field(key: "Create")]
    property create : CreateVectorIndexAction | Nil

    # The configuration for deleting an existing vector index from the table.
    @[JSON::Field(key: "Delete")]
    property delete : DeleteVectorIndexAction | Nil

    def initialize(
      @create : CreateVectorIndexAction | Nil = nil,
      @delete : DeleteVectorIndexAction | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @create
        value.validate!
      end

      if value = @delete
        value.validate!
      end
    end

    def_equals_and_hash(@create, @delete)
  end
end
