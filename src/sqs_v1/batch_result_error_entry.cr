module Amazonite::SqsV1
  class BatchResultErrorEntry
    include JSON::Serializable

    @[JSON::Field(key: "Id")]
    property id : String

    @[JSON::Field(key: "SenderFault")]
    property sender_fault : Bool

    @[JSON::Field(key: "Code")]
    property code : String

    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @id : String,
      @sender_fault : Bool,
      @code : String,
      @message : String | Nil = nil,
    )
    end
  end
end
