module Amazonite::SsmV1
  class TerminateSessionResponse
    include JSON::Serializable

    # The ID of the session that has been terminated.
    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    def initialize(
      @session_id : String | Nil = nil,
    )
    end

    def_equals_and_hash(@session_id)
  end
end
