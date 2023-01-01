module Amazonite::SsmV1
  class TerminateSessionRequest
    include JSON::Serializable

    @[JSON::Field(key: "SessionId")]
    property session_id : String

    def initialize(
      @session_id : String
    )
    end
  end
end
