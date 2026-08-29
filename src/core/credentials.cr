module Amazonite::Core
  class Credentials
    getter access_key_id : String
    getter secret_access_key : String
    getter session_token : String?
    getter expiration : Time?

    def initialize(
      @access_key_id : String,
      @secret_access_key : String,
      @session_token : String? = nil,
      @expiration : Time? = nil,
    )
    end

    # static credentials (no expiration) never expire; temporary credentials
    # are treated as stale slightly before their real expiry so a refresh can
    # happen before an in-flight request gets signed with a dead token
    def expired?(now : Time = Time.utc, buffer : Time::Span = 1.minute) : Bool
      return false if @expiration.nil?
      @expiration.as(Time) <= now + buffer
    end
  end
end
