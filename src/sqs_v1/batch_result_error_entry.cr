module Amazonite::SqsV1
  # Gives a detailed description of the result of an action on each entry in the request.
  class BatchResultErrorEntry
    include JSON::Serializable

    # The `Id` of an entry in a batch request.
    @[JSON::Field(key: "Id")]
    property id : String

    # Specifies whether the error happened due to the caller of the batch API action.
    @[JSON::Field(key: "SenderFault")]
    property sender_fault : Bool

    # An error code representing why the action failed on this entry.
    @[JSON::Field(key: "Code")]
    property code : String

    # A message explaining why the action failed on this entry.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @id : String,
      @sender_fault : Bool,
      @code : String,
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@id, @sender_fault, @code, @message)
  end
end
