module Amazonite::SsmV1
  class TerminateSessionRequest
    include JSON::Serializable

    # The ID of the session to terminate.
    @[JSON::Field(key: "SessionId")]
    property session_id : String

    def initialize(
      @session_id : String,
    )
    end

    def_equals_and_hash(@session_id)
  end
end
