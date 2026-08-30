module Amazonite::SsmV1
  class PutInventoryResult
    include JSON::Serializable

    # Information about the request.
    @[JSON::Field(key: "Message")]
    property message : String | Nil

    def initialize(
      @message : String | Nil = nil,
    )
    end

    def validate! : Nil
    end

    def_equals_and_hash(@message)
  end
end
