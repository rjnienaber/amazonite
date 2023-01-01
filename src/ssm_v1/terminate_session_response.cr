module Amazonite::SsmV1
  class TerminateSessionResponse
    include JSON::Serializable

    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    def initialize(
      @session_id : String | Nil = nil
    )
    end
  end
end
