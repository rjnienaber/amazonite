private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class ResumeSessionResponse
    include JSON::Serializable

    # The ID of the session.
    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    # An encrypted token value containing session and caller information. Used to authenticate the
    # connection to the managed node.
    @[JSON::Field(key: "TokenValue")]
    property token_value : String | Nil

    # A URL back to SSM Agent on the managed node that the Session Manager client uses to send
    # commands and receive output from the managed node. Format:
    # `wss://ssmmessages.**region**.amazonaws.com/v1/data-channel/**session-id**?stream=(input|output)`.
    #
    # **region** represents the Region identifier for an Amazon Web Services Region supported by
    # Amazon Web Services Systems Manager, such as `us-east-2` for the US East (Ohio) Region. For a
    # list of supported **region** values, see the **Region** column in [Systems Manager service
    # endpoints](https://docs.aws.amazon.com/general/latest/gr/ssm.html#ssm_region) in the *Amazon Web
    # Services General Reference*.
    #
    # **session-id** represents the ID of a Session Manager session, such as `1a2b3c4dEXAMPLE`.
    @[JSON::Field(key: "StreamUrl")]
    property stream_url : String | Nil

    def initialize(
      @session_id : String | Nil = nil,
      @token_value : String | Nil = nil,
      @stream_url : String | Nil = nil,
    )
    end

    def validate! : Nil
      if value = @session_id
        raise Core::ValidationError.new("SessionId length must be >= 1") if value.size < 1
        raise Core::ValidationError.new("SessionId length must be <= 96") if value.size > 96
      end

      if value = @token_value
        raise Core::ValidationError.new("TokenValue length must be >= 0") if value.size < 0
        raise Core::ValidationError.new("TokenValue length must be <= 300") if value.size > 300
      end
    end

    def_equals_and_hash(@session_id, @token_value, @stream_url)
  end
end
