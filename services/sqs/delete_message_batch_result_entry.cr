module Amazonite::Sqs
  # Encloses the `Id` of an entry in ` DeleteMessageBatch.`
  class DeleteMessageBatchResultEntry
    include JSON::Serializable

    # Represents a successfully deleted message.
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
