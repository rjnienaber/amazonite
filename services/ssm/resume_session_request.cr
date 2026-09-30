private alias Core = Amazonite::Core

module Amazonite::Ssm
  class ResumeSessionRequest
    include JSON::Serializable

    # The ID of the disconnected session to resume.
    @[JSON::Field(key: "SessionId")]
    property session_id : String

    def initialize(
      @session_id : String,
    )
    end

    def validate! : Nil
      if value = @session_id
        raise Core::ValidationError.new("SessionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SessionId length must be <= 96") if value.size > 96
      end
    end

    def_equals_and_hash(@session_id)
  end
end
