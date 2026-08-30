module Amazonite::SsmV1
  class ResumeSessionRequest
    include JSON::Serializable

    # The ID of the disconnected session to resume.
    @[JSON::Field(key: "SessionId")]
    property session_id : String

    def initialize(
      @session_id : String,
    )
    end
  end
end
