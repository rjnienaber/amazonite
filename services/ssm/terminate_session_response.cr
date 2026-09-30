private alias Core = Amazonite::Core

module Amazonite::Ssm
  class TerminateSessionResponse
    include JSON::Serializable

    # The ID of the session that has been terminated.
    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    def initialize(
      @session_id : String | Nil = nil,
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
