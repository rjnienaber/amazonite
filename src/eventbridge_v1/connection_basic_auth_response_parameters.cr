module Amazonite::EventBridgeV1
  # The authorization parameters for the connection if Basic is specified as the authorization type.
  class ConnectionBasicAuthResponseParameters
    include JSON::Serializable

    # The user name to use for Basic authorization.
    @[JSON::Field(key: "Username")]
    property username : String | Nil

    def initialize(
      @username : String | Nil = nil,
    )
    end
  end
end
