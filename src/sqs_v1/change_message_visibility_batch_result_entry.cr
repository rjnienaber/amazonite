module Amazonite::SqsV1
  # Encloses the `Id` of an entry in ` ChangeMessageVisibilityBatch.`
  class ChangeMessageVisibilityBatchResultEntry
    include JSON::Serializable

    # Represents a message whose visibility timeout has been changed successfully.
    @[JSON::Field(key: "Id")]
    property id : String

    def initialize(
      @id : String,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id)
  end
end
