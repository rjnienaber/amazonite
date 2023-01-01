module Amazonite::SsmV1
  class StartSessionResponse
    include JSON::Serializable

    @[JSON::Field(key: "SessionId")]
    property session_id : String | Nil

    @[JSON::Field(key: "TokenValue")]
    property token_value : String | Nil

    @[JSON::Field(key: "StreamUrl")]
    property stream_url : String | Nil

    def initialize(
      @session_id : String | Nil = nil,
      @token_value : String | Nil = nil,
      @stream_url : String | Nil = nil
    )
    end
  end
end
