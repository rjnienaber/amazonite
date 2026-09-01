private alias Core = Amazonite::Core

module Amazonite::DynamoDB
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

    def validate! : Nil
      if value = @index_name
        raise Core::ValidationError.new("IndexName length must be >= 3") if value.size < 3
        raise Core::ValidationError.new("IndexName length must be <= 255") if value.size > 255
        raise Core::ValidationError.new("IndexName does not match the required pattern") unless value.matches?(Regex.new("^[a-zA-Z0-9_.-]+$"))
      end
    end

    def_equals_and_hash(@index_name)
  end
end
