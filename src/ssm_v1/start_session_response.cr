module Amazonite::SsmV1
  class StartSessionResponse
    include JSON::Serializable

    # The ID of the session.
    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    # An encrypted token value containing session and caller information. This token is used to
    # authenticate the connection to the managed node, and is valid only long enough to ensure the
    # connection is successful. Never share your session's token.
    @[JSON::Field(key: "TokenValue")]
    property token_value : String | Nil

    # A URL back to SSM Agent on the managed node that the Session Manager client uses to send
    # commands and receive output from the node. Format:
    # `wss://ssmmessages.**region**.amazonaws.com/v1/data-channel/**session-id**?stream=(input|output)`
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

    def_equals_and_hash(@session_id, @token_value, @stream_url)
  end
end
